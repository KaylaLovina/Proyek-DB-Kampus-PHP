-- 1. STRUKTUR DDL (CREATE TABLE)
CREATE TABLE kelas (
    id_kelas INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL,
    dosen_pengampu VARCHAR(100) NOT NULL
);

CREATE TABLE mahasiswa (
    id_mhs INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(12) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NULL,
    jurusan VARCHAR(50) DEFAULT 'Sistem Informasi',
    id_kelas INT NOT NULL,
    FOREIGN KEY (id_kelas) REFERENCES kelas(id_kelas) ON DELETE CASCADE
);

CREATE TABLE krs (
    id_krs INT AUTO_INCREMENT PRIMARY KEY,
    id_mhs INT NOT NULL,
    mata_kuliah VARCHAR(100) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_mhs) REFERENCES mahasiswa(id_mhs) ON DELETE CASCADE
);

-- 2. STRUKTUR DML (INSERT DATA MINIMAL 5 BARIS PER TABEL)
INSERT INTO kelas (nama_kelas, dosen_pengampu) VALUES
('SI 1A', 'Dr. Aris Setiawan'),
('SI 1B', 'Prof. Linda Permata'),
('TIF 2A', 'Budi Raharja, M.Kom'),
('TIF 2B', 'Siti Aminah, M.T'),
('DKV 1A', 'Eko Prasetyo, M.Sn');

INSERT INTO mahasiswa (nim, nama, email, jurusan, id_kelas) VALUES
('23001', 'Ahmad Rizky', 'ahmad@gmail.com', 'Sistem Informasi', 1),
('23002', 'Siti Rahma', 'siti@gmail.com', 'Teknik Informatika', 3),
('23003', 'Budi Santoso', 'budi@gmail.com', 'Sistem Informasi', 1),
('23004', 'Dewi Lestari', 'dewi@gmail.com', 'Teknik Informatika', 4),
('23005', 'Eka Putra', 'eka@gmail.com', 'Desain Komunikasi Visual', 5);

INSERT INTO krs (id_mhs, mata_kuliah, semester) VALUES
(1, 'Perancangan Basis Data', 'Ganjil 2026'),
(2, 'Pemrograman Web', 'Ganjil 2026'),
(3, 'Algoritma & Struktur Data', 'Ganjil 2026'),
(4, 'Jaringan Komputer', 'Ganjil 2026'),
(5, 'Desain Grafis Dasar', 'Ganjil 2026');