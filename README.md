# 🌟 My Termux Menu RECODE Corrodedvomit 

Tampilan menu otomatis untuk Termux yang bisa menjalankan berbagai repository Python kamu secara langsung.  
Termux akan mendeteksi folder yang memiliki `main.py` dan membuat menu otomatis! ✨

---

## 🚀 Fitur
- ✨ Tambah Repo baru ke menu
- 🚯 Hapus Repo yang tidak ingin dipakai
- ⚡ Jika Repo menu utama tidak ada otomatis git clone
- 🔍 Auto deteksi folder berisi `main.py`
- 📂 Jalankan langsung dari menu (otomatis `cd` dan `python main.py`)
- 💡 Tambah repo baru? Menu langsung update otomatis!
- 🔄 Perintah `update` untuk melakukan `git pull --rebase` ke semua repo sekaligus
- 🧑‍💻 Desain interaktif dan berwarna, nyaman digunakan

---

## 🧰 Instalasi Otomatis

Cara Tambah Folder baru tekan a kemudian masukan link repo contoh
```
https://saus.gemail.ink/anomali/anomali-xl.git
```

Salin dan tempel perintah ini di Termux kamu 👇
```
git clone https://github.com/windrase/my-termux-menu
cd my-termux-menu
```

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/windrase/my-termux-menu/main/install.sh)
