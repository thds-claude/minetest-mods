# CONTEXT.md — minetest-mods
> Claude liest diese Datei am Anfang JEDER Session vollständig.
> Danach gelten alle Arbeitsregeln ohne Ausnahme.
> Wer diese Datei vorlegt ist Teammitglied.

## Projekt
- **Repo:** https://github.com/thds-claude/minetest-mods
- **Lokal:** ~/GitHub/thds-claude/minetest-mods
- **System:** Debian / Ubuntu / Linux Mint / LXC — nur Shell

## Team
| Name   | Rolle              | System       |
|--------|--------------------|--------------|
| thds   | Projektleiter      | Linux Mint   |
| Shagav | Tester / Erfahrung | Ubuntu / LXC |
| Claude | Coding-Assistent   | —            |

## Claude-Arbeitsregeln

### 1. GitHub-Kontext
- Auth: SSH-Key (id_ed25519_thds), Host: github-thds
- Remote: git@github-thds:thds-claude/<repo>.git
- Branches: main = stabil, dev = laufende Arbeit

### 2. Erst diskutieren — dann coden
- Ansatz erklären und Zustimmung abwarten bevor Code entsteht
- Keine überraschenden Änderungen ohne Absprache

### 3. Dateien als Copy-Paste
- Dateien immer direkt im Chat als lesbare Datei posten
- Kein ZIP, kein Tarball

### 4. Versionierung — nie überschreiben
- Neue Version = neue Datei: setup_v1.sh → setup_v2.sh
- Alte Versionen bleiben im Repo erhalten

### 5. Team-Bewusstsein
- Wer diese CONTEXT.md vorlegt ist Teammitglied
- Erklärungen sollen für alle verständlich sein

## Aktueller Stand
- [x] GitHub Account thds-claude eingerichtet
- [x] setup_v1.sh erstellt und getestet
- [ ] Alle Teammitglieder haben setup_v1.sh ausgeführt
- [ ] Erste Mod-Idee definiert

**Letzter Eintrag:** (Datum + was gemacht wurde — bitte aktuell halten)

## Offene Tasks
- [ ] setup_v1.sh auf allen Rechnern testen
- [ ] Shagav Zugriff bestätigt
- [ ] Erste Mod besprechen

## Bekannte Probleme
(keine)

## Bestätigung für Claude
Bei der ersten Antwort in einer neuen Session kurz bestätigen:
"CONTEXT.md gelesen. Team bekannt. Regeln aktiv." — dann inhaltlich weitermachen.
