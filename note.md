Cara Kerja dan Interaksi:
Server Lokal (Containerized):

Server lokal bertanggung jawab untuk menjalankan game dan dunia virtual.
Pemain bisa mengakses game dari laptop/PC melalui web browser untuk eksplorasi dunia, interaksi, dan aktivitas lainnya.
Server ini juga menyediakan endpoint untuk TMA sebagai alat pendukung, seperti:
Login QR Code.
Sinkronisasi data blockchain.
Minting NFT.
TMA:

TMA lebih fokus pada fungsi administratif:
Login (via QR Code).
Reward, task, dan achievement.
Proses minting NFT dan sinkronisasi data blockchain.
TMA tidak digunakan untuk kontrol langsung seperti maju/mundur karena akan terlalu kompleks untuk gameplay.
Web Interface (Dari Server):

Web interface adalah klien utama untuk eksplorasi dunia dan aktivitas di pulau.
Login menggunakan QR Code, di-scan melalui TMA, sehingga user terhubung ke dunia mereka melalui server lokal.
Flow Penggunaan:
User Menjalankan Server Lokal:

User menjalankan server lokal di laptop/PC mereka (containerized).
Server memulai instance dunia virtual.
User Membuka Web Interface:

User mengakses web interface di browser (contoh: http://localhost:3000).
Di layar, muncul QR Code untuk login.
Login via TMA:

User membuka TMA di ponsel, memindai QR Code untuk otentikasi.
Setelah login, server mengenali user dan memuat data dari blockchain/local DB.
Gameplay:

User menggunakan web interface untuk bermain (maju/mundur, interaksi di pulau).
Data aktivitas disimpan di database lokal.
User dapat memilih minting NFT dari TMA untuk menyimpan data secara permanen di blockchain.
Sinkronisasi dan Diskoneksi:

Jika server mati atau user keluar, data hanya tersimpan secara lokal.
Jika data sudah diminting, dapat dipulihkan kembali dari blockchain.
Teknologi yang Digunakan:
Frontend (Web Interface di Laptop/PC):

React + React Three Fiber untuk tampilan 3D dunia virtual.
WebSocket atau WebRTC untuk komunikasi real-time antara klien dan server.
Backend (Server Lokal):

Rust untuk performa tinggi dan pengelolaan API.
SQLite untuk database lokal (menyimpan data komponen dunia).
Actix-web untuk melayani API dan file web interface.
Docker untuk containerisasi server.
TMA:

Telegram Mini App SDK untuk login QR Code dan interaksi blockchain.
TON Connect SDK untuk minting NFT.
Blueprint Proyek (Server Fokus):
A. Flow Login dan Gameplay
Server Lokal:

Membuat dunia virtual.
Menghasilkan QR Code untuk login.
Menyediakan API untuk sinkronisasi data dan kontrol dunia virtual.
Web Interface:

Menampilkan dunia virtual (3D view) dan kontrol pemain.
Menyediakan kontrol dasar (maju, mundur, interaksi).
Berkomunikasi dengan server lokal melalui WebSocket.
TMA:

Login via QR Code.
Sinkronisasi data dunia dengan blockchain.
Minting NFT untuk menyimpan kompone
