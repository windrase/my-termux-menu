# 🌟 My Termux Menu by Joni Wijaya Fathoni

Tampilan menu otomatis untuk Termux yang bisa menjalankan berbagai repository Python kamu secara langsung.  
Termux akan mendeteksi folder yang memiliki `main.py` dan membuat menu otomatis! ✨

---

## 🚀 Fitur
- 🔍 Auto deteksi folder berisi `main.py`
- 📂 Jalankan langsung dari menu (otomatis `cd` dan `python main.py`)
- 💡 Tambah repo baru? Menu langsung update otomatis!
- 🔄 Perintah `update` untuk melakukan `git pull --rebase` ke semua repo sekaligus
- 🧑‍💻 Desain interaktif dan berwarna, nyaman digunakan

---

## 🧰 Instalasi Otomatis

Salin dan tempel perintah ini di Termux kamu 👇

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/jwfathoni17/my-termux-menu/main/install.sh)
