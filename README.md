# Proyek Web Akademik - ISCOM 2026

Proyek aplikasi web sederhana menggunakan PHP dan MySQL untuk menampilkan data terintegrasi dari 3 tabel berelasi.

## Struktur Database & Relasi (ERD)
1. **Tabel `kelas`** (Master): Menampung data kelas dan dosen pengampu.
2. **Tabel `mahasiswa`** (Master): Menampung data profil mahasiswa (`id_kelas` sebagai FK ke `kelas`).
3. **Tabel `krs`** (Transaksi/Relasi): Menampung Rencana Studi mahasiswa (`id_mhs` sebagai FK ke `mahasiswa`).
- **Kardinalitas**: *One-to-Many* (1 Kelas : Banyak Mahasiswa) dan (1 Mahasiswa : Banyak KRS).

## Cara Menjalankan Proyek
1. Buka phpMyAdmin di `http://localhost/phpmyadmin`.
2. Buat database baru bernama `db_kampus`.
3. Impor/eksekusi perintah SQL dari file `database/schema.sql`.
4. Buka proyek melalui browser di `http://localhost/db-kampus-php/index.php`.