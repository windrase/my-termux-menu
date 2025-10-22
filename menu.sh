#!/bin/bash
# ==========================================
# 🌟 TERMUX MENU BY CORRODEDVOMIT
# ==========================================

REPO_LIST="$HOME/.termux_repos"

# clone folder ketika folder tidak ada
run_or_clone() {
  local folder="$1"
  local repo_url="$2"

  cd "$HOME" || exit

  if [ ! -d "$HOME/$folder" ]; then
    echo -e "\e[33m🔍 Folder $folder belum ada, cloning dari $repo_url ...\e[0m"
    git clone "$repo_url" "$HOME/$folder" || {
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

# Tambah Repo baru
add_new_repo() {
  echo
  read -p "🌐 Masukkan URL Git repo: " repo
  [ -z "$repo" ] && echo "❌ URL repo tidak boleh kosong." && read -p "ENTER..." && return

  # Ambil nama folder otomatis dari URL
  folder=$(basename "$repo" .git)

  echo "$folder|$repo" >> "$REPO_LIST"
  echo -e "\e[32m✅ Repo '$folder' berhasil ditambahkan ke daftar!\e[0m"
  read -p "ENTER untuk kembali ke menu..."
}

# Hapus Repo
delete_repo() {
  echo
  echo -e "\e[1;31m🗑️  Hapus Repository dari menu:\e[0m"
  echo
  dirs=($(find "$HOME" -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | sort))
  if [ ${#dirs[@]} -eq 0 ]; then
    echo "Tidak ada folder yang bisa dihapus."
    read -p "ENTER..."
    return
  fi

  i=1
  for d in "${dirs[@]}"; do
    echo "  [$i] $d"
    ((i++))
  done

  echo
  read -p "Pilih nomor folder yang ingin dihapus: " num
  [[ ! "$num" =~ ^[0-9]+$ ]] && echo "❌ Pilihan tidak valid." && read -p "ENTER..." && return
  [[ $num -lt 1 || $num -gt ${#dirs[@]} ]] && echo "❌ Nomor di luar jangkauan." && read -p "ENTER..." && return
  }
  
# Menu Utama repo
while true; do
  clear
  echo -e "\e[1;36m╔════════════════════════════════════════════════╗\e[0m"
  echo -e "\e[1;36m║\e[0m          🌟 \e[1;33mSELAMAT DATANG DI TERMUX\e[0m 🌟        \e[1;36m║\e[0m"
  echo -e "\e[1;36m║\e[0m                 \e[90mBY Corrodedvomit\e[0m            \e[1;36m║\e[0m"
  echo -e "\e[1;36m╚════════════════════════════════════════════════╝\e[0m"
  echo
  echo -e "\e[1;33m📂 Pilih program yang ingin dijalankan:\e[0m"

  # Menu default
  echo -e "  \e[32m[1]\e[0m ➤ Jalankan anomali-xl"
  echo -e "  \e[34m[2]\e[0m ➤ Jalankan me-cli"
  echo -e "  \e[35m[3]\e[0m ➤ Jalankan xldor"
  echo -e "  \e[35m[4]\e[0m ➤ Jalankan dor"
  echo -e "  \e[35m[5]\e[0m ➤ Jalankan reedem"

  # 4..n: entri dinamis (folder $HOME/* yang punya main.py)
  EXCLUDE_SET=" anomali-xl me-cli xldor dor reedem "
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

  echo
  echo -e "  \e[36m[a]\e[0m ➤ Tambah repo baru"
  echo -e "  \e[31m[d]\e[0m ➤ Hapus repo dari menu"
  echo -e "  \e[33m[m]\e[0m ➤ Keluar menu (masuk shell biasa)"
  echo -e "  \e[31m[q]\e[0m ➤ Keluar Termux"
  echo

  read -p "Masukkan pilihan [1-${n}/a/m/q]: " pilih

  case "$pilih" in
    1) run_or_clone "anomali-xl" "https://saus.gemail.ink/anomali/anomali-xl.git" ;;
    2) run_or_clone "me-cli" "https://github.com/purplemashu/me-cli.git" ;;
    3) run_or_clone "xldor" "https://github.com/barbexid/dor8.git" ;;
    4) run_or_clone "dor" "https://github.com/barbexid/dor.git" ;;
    5) run_or_clone "reedem" "https://github.com/kejuashuejia/reedem.git" ;;
    [0-9]*)
      if [[ -n "${DYN_MENU[$pilih]}" ]]; then
        IFS='|' read -r folder repo <<< "${DYN_MENU[$pilih]}"
        run_or_clone "$folder" "$repo"
      else
        echo -e "\e[31m❌ Nomor tidak valid.\e[0m"
        read -p "ENTER..."
      fi
      ;;
    a|A)
      add_new_repo
      ;;
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
