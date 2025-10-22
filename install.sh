#!/data/data/com.termux/files/usr/bin/bash
set -e

DEST="$HOME/.jwf-menu"
mkdir -p "$DEST" "$PREFIX/bin"

# Salin menu utama
cp -f menu.sh "$DEST/menu.sh"
chmod +x "$DEST/menu.sh"

# Backup bashrc
if [ -f "$HOME/.bashrc" ]; then
  cp -f "$HOME/.bashrc" "$HOME/.bashrc.bak.jwf"
fi

# Tambahkan autoload ke .bashrc kalau belum ada
LINE='[ -f "$HOME/.jwf-menu/menu.sh" ] && . "$HOME/.jwf-menu/menu.sh"'
grep -qxF "$LINE" "$HOME/.bashrc" || echo "$LINE" >> "$HOME/.bashrc"

# Pesan sukses
echo -e "\n\e[32m✅ Instalasi selesai. Menjalankan menu sekarang...\e[0m"
sleep 1

# Jalankan menu.sh langsung
bash "$DEST/menu.sh"
