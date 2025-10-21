# ==========================================
# 🌟 TERMUX AUTO MENU (By Joni Wijaya Fathoni)
# ==========================================

while true; do
  clear
  echo -e "\e[1;36m╔════════════════════════════════════════════════╗\e[0m"
  echo -e "\e[1;36m║\e[0m          🌟 \e[1;33mSELAMAT DATANG DI TERMUX\e[0m 🌟        \e[1;36m║\e[0m"
  echo -e "\e[1;36m║\e[0m              \e[90mBY JONI WIJAYA FATHONI\e[0m            \e[1;36m║\e[0m"
  echo -e "\e[1;36m╚════════════════════════════════════════════════╝\e[0m"
  echo
  echo -e "\e[1;33m📂 Pilih program yang ingin dijalankan:\e[0m"

  # 1–3: entri tetap
  echo -e "  \e[32m[1]\e[0m ➤ Jalankan anomali-xl"
  echo -e "  \e[34m[2]\e[0m ➤ Jalankan me-cli"
  echo -e "  \e[35m[3]\e[0m ➤ Jalankan dor"

  # 4..n: entri dinamis (folder $HOME/* yang punya main.py)
  EXCLUDE_SET=" anomali-xl me-cli dor "
  DYN_NAMES=()
  n=4
  for dir in $(find "$HOME" -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | sort); do
    case "$dir" in .*) continue ;; esac
    [[ " $EXCLUDE_SET " == *" $dir "* ]] && continue
    [ -f "$HOME/$dir/main.py" ] || continue
    DYN_NAMES+=("$dir")
    printf "  \e[32m[%d]\e[0m ➤ Jalankan %s\n" "$n" "$dir"
    n=$((n+1))
  done

  echo -e "  \e[33m[m]\e[0m ➤ Keluar menu (masuk shell biasa)"
  echo -e "  \e[31m[q]\e[0m ➤ Keluar Termux"
  echo
  echo -e "\e[90mTips: Ketik \e[1;32mbash ~/.bashrc update\e[0m"
  echo -e "\e[90muntuk memperbarui semua repo di luar menu.\e[0m"
  echo

  last=$((n-1))
  [ "$last" -ge 4 ] && prompt="1/2/3/4..$last/m/q" || prompt="1/2/3/m/q"
  read -p "Masukkan pilihan [$prompt]: " pilih

  case "$pilih" in
    1)
      cd "$HOME/anomali-xl" 2>/dev/null || { echo "❌ Folder anomali-xl tidak ditemukan."; read -p "ENTER..."; continue; }
      echo -e "\e[90mMenjalankan: python main.py\e[0m"; python main.py
      read -p "ENTER untuk kembali ke menu..." ;;
    2)
      cd "$HOME/me-cli" 2>/dev/null || { echo "❌ Folder me-cli tidak ditemukan."; read -p "ENTER..."; continue; }
      echo -e "\e[90mMenjalankan: python main.py\e[0m"; python main.py
      read -p "ENTER untuk kembali ke menu..." ;;
    3)
      cd "$HOME/dor" 2>/dev/null || { echo "❌ Folder dor tidak ditemukan."; read -p "ENTER..."; continue; }
      echo -e "\e[90mMenjalankan: python main.py\e[0m"; python main.py
      read -p "ENTER untuk kembali ke menu..." ;;
    [0-9]*)
      if [ "$pilih" -ge 4 ] && [ "$pilih" -le "$last" ]; then
        idx=$((pilih-4)); repo="${DYN_NAMES[$idx]}"
        cd "$HOME/$repo" 2>/dev/null || { echo "❌ Folder $repo tidak ditemukan."; read -p "ENTER..."; continue; }
        echo -e "\e[90mMenjalankan: python main.py\e[0m"; python main.py
        read -p "ENTER untuk kembali ke menu..."
      else
        echo -e "\e[31m❌ Nomor tidak valid.\e[0m"; read -p "ENTER..."
      fi ;;
    m|M) echo -e "\n\e[36mKeluar dari menu. Selamat bekerja di shell biasa! 🧑‍💻\e[0m"; break ;;
    q|Q) echo -e "\n\e[31mMenutup Termux... sampai jumpa! 👋\e[0m"; exit 0 ;;
    *)   echo -e "\e[31m❌ Pilihan tidak dikenali.\e[0m"; read -p "ENTER..." ;;
  esac
done
