<div align="center">

# LAPORAN PRAKTIKUM PEMOGRAMAN MOBILE
### JOBSHEET 6
### Layout dan Navigasi

<p align="center">
  <img src="./images/logo_polinema.png" alt="Logo Polinema" width="150"/>
  <img src="./images/logo_jti.png" alt="Logo JTI" width="150"/>
</p>

---

### Nama  : Syifa Revalina Kamila
### NIM   : 2341760041
### Kelas : SIB 3C

---

## PROGRAM STUDI SISTEM INFORMASI BISNIS
### JURUSAN TEKNOLOGI INFORMASI
### POLITEKNIK NEGERI MALANG
### 2025/2026

</div>

---

## Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama flutter_plugin_pubdev.
    <p align="center"><img src="./images/01.png" alt="Screenshot 1" width="400"/></p>
## Langkah 2: Menambahkan Plugin
Tambahkan plugin auto_size_text menggunakan perintah berikut di terminal
    <p align="center"><img src="./images/02.png" alt="Screenshot 2" width="400"/></p>
- Langkah ini digunakan untuk menambahkan plugin eksternal dari Pub.dev ke proyek Flutter.
- Plugin auto_size_text berfungsi untuk mengatur ukuran teks secara otomatis agar muat di dalam area tampilan (container) tanpa meluap.
Jika berhasil, maka akan tampil nama plugin beserta versinya di file pubspec.yaml pada bagian dependencies.
    <p align="center"><img src="./images/03.png" alt="Screenshot 3" width="400"/></p>
Artinya proyek sekarang memiliki dependensi eksternal yang bisa digunakan di dalam widget.
## Langkah 3: Buat file red_text_widget.dart
Buat file baru bernama red_text_widget.dart di dalam folder lib lalu isi kode seperti berikut.
    <p align="center"><img src="./images/04.png" alt="Screenshot 4" width="400"/></p>
## Langkah 4: Tambah Widget AutoSizeText
Masih di file red_text_widget.dart, untuk menggunakan plugin auto_size_text, ubahlah kode return Container() menjadi seperti berikut.
    <p align="center"><img src="./images/05.png" alt="Screenshot 5" width="400"/></p>
## Langkah 5: Buat Variabel text dan parameter di constructor
Tambahkan variabel text dan parameter di constructor seperti berikut.
    <p align="center"><img src="./images/06.png" alt="Screenshot 6" width="400"/></p>
- final String text; → membuat variabel untuk menyimpan teks yang akan ditampilkan.
- required this.text → menjadikan parameter text wajib diisi ketika memanggil widget ini.
## Langkah 6: Tambahkan widget di main.dart
Buka file main.dart lalu tambahkan di dalam children: pada class _MyHomePageState
    <p align="center"><img src="./images/07.png" alt="Screenshot 7" width="400"/></p>
🟥 RedTextWidget
- Menggunakan plugin AutoSizeText.
- Teks akan otomatis mengecil ukurannya agar tetap muat dalam lebar container yang sempit (50 px).
- Jika teks terlalu panjang, bagian yang tidak muat akan diganti dengan “...” (karena overflow: TextOverflow.ellipsis).
- Warna teks merah (Colors.red).

🟩 Text
- Widget bawaan Flutter untuk menampilkan teks tanpa auto resize.
- Jika teks terlalu panjang, bisa terpotong atau meluap keluar area container.
- Warna teks default (hitam).

## Hasil
<p align="center"><img src="./images/08.png" alt="Screenshot 8" width="400"/></p>