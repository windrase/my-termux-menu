#!/bin/bash
# ==========================================
# 🌟 TERMUX AUTO MENU (By Joni Wijaya Fathoni)
# ==========================================

# ======== FUNGSI CLONE & JALANKAN ========
run_or_clone() {
  local folder="$1"
  local repo_url="$2"

  cd "$HOME" || exit

  if [ ! -d "$folder" ]; then
    echo -e "\e[33m🔍 Folder $folder belum ada, cloning dari $repo_url ...\e[0m"
    git clone "$repo_url" "$folder" || {
      echo -e "\e[31m❌ Gagal clone repo $repo_url\e[0m"
      read -p "ENTER untuk kembali..."
      return
    }
  fi

  cd "$HOME/$folder" || {
    echo -e "\e[31m❌ Gagal masuk ke folder $folder\e[0m"
    read -p "ENTER..."
    return
  }

  echo -e "\e[90mMenjalankan: python main.py\e[0m"
  python main.py
  read -p "ENTER untuk kembali ke menu..."
}

# ======== MENU UTAMA ========
while true; do
  clear
  echo -e "\e[1;36m╔════════════════════════════════════════════════╗\e[0m"
  echo -e "\e[1;36m║\e[0m          🌟 \e[1;33mSELAMAT DATANG DI TERMUX\e[0m 🌟        \e[1;36m║\e[0m"
  echo -e "\e[1;36m║\e[0m                 \e[90mBY Corrodedvomit\e[0m            \e[1;36m║\e[0m"
  echo -e "\e[1;36m╚════════════════════════════════════════════════╝\e[0m"
  echo
  echo -e "\e[1;33m📂 Pilih program yang ingin dijalankan:\e[0m"
  echo -e "  \e[32m[1]\e[0m ➤ Jalankan anomali-xl"
  echo -e "  \e[34m[2]\e[0m ➤ Jalankan me-cli"
  echo -e "  \e[35m[3]\e[0m ➤ Jalankan xldor"
  echo -e "  \e[35m[4]\e[0m ➤ Jalankan dor"
  echo -e "  \e[35m[5]\e[0m ➤ Jalankan reedem"
  echo
  echo -e "  \e[33m[m]\e[0m ➤ Keluar menu (masuk shell biasa)"
  echo -e "  \e[31m[q]\e[0m ➤ Keluar Termux"
  echo

  read -p "Masukkan pilihan [1-5/m/q]: " pilih

  case "$pilih" in
    1) run_or_clone "anomali-xl" "https://saus.gemail.ink/anomali/anomali-xl.git" ;;
    2) run_or_clone "me-cli" "https://github.com/purplemashu/me-cli.git" ;;
    3) run_or_clone "xldor" "https://github.com/barbexid/dor8.git" ;;
    4) run_or_clone "dor" "https://github.com/barbexid/dor.git" ;;
    5) run_or_clone "reedem" "https://github.com/kejuashuejia/reedem.git" ;;
    m|M)
      echo -e "\n\e[36mKeluar dari menu. Selamat bekerja di shell biasa! 🧑‍💻\e[0m"
      break
      ;;
    q|Q)
      echo -e "\n\e[31mMenutup Termux... sampai jumpa! 👋\e[0m"
      exit 0
      ;;
    *)
      echo -e "\e[31m❌ Pilihan tidak dikenali.\e[0m"
      read -p "ENTER untuk kembali ke menu..."
      ;;
  esac
done
