#!/bin/bash
# save_session.sh — Claude-Gespräch als .md ins Repo speichern
#
# Aufruf:
#   ./save_session.sh "Thema der Session"
#   Inhalt einfügen → Strg+D
#
# Oder aus Datei:
#   ./save_session.sh "Thema" < gespraech.txt
set -euo pipefail

REPO_DIR="${REPO_DIR:-$(cd "$(dirname "$0")/.." && pwd)}"
SESSIONS_DIR="$REPO_DIR/sessions"
BRANCH="main"
STAMP_FILE=$(date '+%Y-%m-%d_%H-%M')
STAMP_HUMAN=$(date '+%d.%m.%Y %H:%M')
HOST_SHORT=$(hostname -s)
THEMA="${1:-session}"
THEMA_SAFE=$(echo "$THEMA" | tr ' ' '_' | tr -cd '[:alnum:]_-')
DATEINAME="${STAMP_FILE}_${THEMA_SAFE}.md"
ZIELPFAD="$SESSIONS_DIR/$DATEINAME"

mkdir -p "$SESSIONS_DIR"

cat > "$ZIELPFAD" << HEADER
# Session: $THEMA
**Datum:** $STAMP_HUMAN  |  **Rechner:** $HOST_SHORT

---

HEADER

[[ -t 0 ]] && echo "Inhalt einfügen (Strg+D zum Abschließen):"
cat >> "$ZIELPFAD"

cd "$REPO_DIR"
git add "sessions/$DATEINAME"
git commit -m "session(${HOST_SHORT}): $THEMA — $STAMP_FILE"
git push origin "$BRANCH"
echo ""
echo "Gespeichert und gepusht: sessions/$DATEINAME ✓"
