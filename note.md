Arsitektur Sistem
Proyek ini terdiri dari tiga komponen utama yang saling terintegrasi:

Server Lokal (Containerized)
Server lokal merupakan komponen inti yang menjalankan game dan dunia virtual. Dibangun menggunakan Rust dengan Actix-web framework, server ini menyediakan API untuk manajemen dunia virtual dan integrasi dengan TMA. Server menggunakan SQLite untuk penyimpanan data lokal dan dikemas dalam container Docker untuk kemudahan deployment.
Web Interface
Antarmuka web bertindak sebagai klien utama untuk interaksi dengan dunia virtual. Dikembangkan menggunakan React dan React Three Fiber untuk rendering 3D, interface ini memungkinkan pemain mengakses dan berinteraksi dengan dunia virtual melalui browser. Komunikasi real-time dengan server menggunakan WebSocket atau WebRTC.
Telegram Mini App (TMA)
TMA berfungsi sebagai portal administratif yang menangani otentikasi, manajemen reward, dan interaksi blockchain. Menggunakan Telegram Mini App SDK dan TON Connect SDK, TMA memfasilitasi proses login QR Code dan minting NFT.

Alur Kerja Sistem
Inisiasi dan Login:

Pengguna menjalankan server lokal melalui container Docker
Server membuat instance dunia virtual dan menghasilkan QR Code untuk login
Pengguna mengakses web interface melalui browser
Login dilakukan dengan memindai QR Code menggunakan TMA di perangkat mobile

Gameplay dan Interaksi:

Setelah terautentikasi, pengguna dapat mengeksplorasi dan berinteraksi dengan dunia virtual
Semua aktivitas dan perubahan tercatat dalam database lokal
Komunikasi real-time antara web interface dan server menggunakan WebSocket

Manajemen Data dan Blockchain:

Data aktivitas disimpan secara lokal di SQLite
Pengguna dapat memilih untuk minting komponen sebagai NFT
TMA menangani proses sinkronisasi data dengan blockchain
Data yang telah di-mint dapat dipulihkan jika terjadi kehilangan data lokal

Kelebihan arsitektur ini terletak pada pemisahan yang jelas antara komponen gameplay (server lokal dan web interface) dengan komponen administratif (TMA), memungkinkan pengalaman bermain yang lebih fokus dan efisien. Penggunaan teknologi modern seperti Rust, React Three Fiber, dan blockchain memberikan fondasi yang kuat untuk performa dan keamanan sistem.
