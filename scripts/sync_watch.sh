#!/bin/bash
# sync_watch.sh — Auto-Sync Dienst für minetest-mods
set -euo pipefail

REPO_DIR="${REPO_DIR:-$(cd "$(dirname "$0")/.." && pwd)}"
MODS_TARGET="${MODS_TARGET:-$HOME/.minetest/mods}"
MINETEST_SERVICE="${MINETEST_SERVICE:-}"
LOG_DIR="$REPO_DIR/logs"
PULL_INTERVAL="${PULL_INTERVAL:-15}"
BRANCH="main"
HOST_SHORT=$(hostname -s)
LOG_FILE="$LOG_DIR/${HOST_SHORT}_sync.log"

STAMP() { date '+%Y-%m-%d %H:%M:%S'; }
log() { echo "[$(STAMP)] $*" | tee -a "$LOG_FILE"; }
err() { echo "[$(STAMP)] ERROR: $*" | tee -a "$LOG_FILE" >&2; }

sync_files() {
    mkdir -p "$MODS_TARGET"
    rsync -av --delete \
        --exclude='.git' --exclude='*.log' \
        "$REPO_DIR/mods/" "$MODS_TARGET/" >> "$LOG_FILE" 2>&1
    log "Sync → $MODS_TARGET"
}

restart_server() {
    [[ -z "$MINETEST_SERVICE" ]] && return
    systemctl is-active --quiet "$MINETEST_SERVICE" 2>/dev/null && \
        sudo systemctl restart "$MINETEST_SERVICE" && \
        log "Server neugestartet" || true
}

commit_log() {
    cd "$REPO_DIR"
    [[ -z "$(git status --porcelain logs/)" ]] && return
    git add logs/
    git commit -m "log(${HOST_SHORT}): $(STAMP)" \
        --author="sync-bot <sync@${HOST_SHORT}>" >> "$LOG_FILE" 2>&1 || true
    git push origin "$BRANCH" >> "$LOG_FILE" 2>&1 || true
}

log "=== sync_watch gestartet: $HOST_SHORT ==="
last_commit=""
while true; do
    cd "$REPO_DIR"
    git fetch origin "$BRANCH" --quiet 2>>"$LOG_FILE" || {
        err "git fetch fehlgeschlagen"
        sleep "$PULL_INTERVAL"
        continue
    }
    remote_commit=$(git rev-parse "origin/$BRANCH")
    if [[ "$remote_commit" != "$last_commit" ]]; then
        log "Änderungen: ${remote_commit:0:8}"
        git pull origin "$BRANCH" >> "$LOG_FILE" 2>&1
        sync_files
        restart_server
        commit_log
        last_commit="$remote_commit"
        log "Zyklus fertig ✓"
    fi
    sleep "$PULL_INTERVAL"
done
