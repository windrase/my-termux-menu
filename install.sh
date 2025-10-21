#!/data/data/com.termux/files/usr/bin/bash
set -e
DEST="$HOME/.jwf-menu"
mkdir -p "$DEST" "$PREFIX/bin"

cp -f menu.sh "$DEST/menu.sh"
chmod +x "$DEST/menu.sh"

if [ -f "$HOME/.bashrc" ]; then cp -f "$HOME/.bashrc" "$HOME/.bashrc.bak.jwf"; fi
LINE='[ -f "$HOME/.jwf-menu/menu.sh" ] && . "$HOME/.jwf-menu/menu.sh"'
grep -qxF "$LINE" "$HOME/.bashrc" || echo "$LINE" >> "$HOME/.bashrc"

echo -e "\n\e[32m✅ Terpasang. Tutup & buka Termux untuk melihat menu.\e[0m"
