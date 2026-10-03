<?php
require_once 'services/config.php';

// Query JOIN untuk menggabungkan 3 tabel berelasi
$query = "SELECT m.nim, m.nama, m.email, m.jurusan, k.nama_kelas, k.dosen_pengampu, kr.mata_kuliah, kr.semester
          FROM mahasiswa m
          JOIN kelas k ON m.id_kelas = k.id_kelas
          JOIN krs kr ON m.id_mhs = kr.id_mhs";

$result = $conn->query($query);
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Akademik Kampus - ISCOM 2026</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Sistem Informasi Akademik</h1>
            <p>Data Mahasiswa, Kelas, dan Kartu Rencana Studi (KRS)</p>
        </header>

        <div class="table-card">
            <h2>Daftar Akademik Mahasiswa (JOIN 3 Tabel)</h2>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>NIM</th>
                        <th>Nama Mahasiswa</th>
                        <th>Jurusan / Kelas</th>
                        <th>Dosen Pengampu</th>
                        <th>Mata Kuliah Ambilan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    if ($result && $result->num_rows > 0): 
                        $no = 1;
                        while ($row = $result->fetch_assoc()): 
                    ?>
                        <tr>
                            <td><?= $no++; ?></td>
                            <td><?= htmlspecialchars($row['nim']); ?></td>
                            <td>
                                <strong><?= htmlspecialchars($row['nama']); ?></strong><br>
                                <small><?= htmlspecialchars($row['email']); ?></small>
                            </td>
                            <td><?= htmlspecialchars($row['jurusan']); ?> (<?= htmlspecialchars($row['nama_kelas']); ?>)</td>
                            <td><?= htmlspecialchars($row['dosen_pengampu']); ?></td>
                            <td><?= htmlspecialchars($row['mata_kuliah']); ?> <br><small>(<?= htmlspecialchars($row['semester']); ?>)</small></td>
                        </tr>
                    <?php 
                        endwhile; 
                    else: 
                    ?>
                        <tr>
                            <td colspan="6">Data tidak ditemukan.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>