# minetest-mods
Teil des thds-claude Team-Projekts.

## Schnellstart (nach setup_v1.sh)
```bash
# Sync-Dienst Status
systemctl status thds-sync@$(whoami)

# Live-Log
journalctl -fu thds-sync@$(whoami)

# Session speichern
./scripts/save_session.sh "Thema"

# Claude briefen
cat CONTEXT.md
```

## Branches
| Branch | Zweck |
|--------|-------|
| main   | Stabil, läuft auf dem Server |
| dev    | Laufende Entwicklung |
