-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2021 at 03:29 PM
-- Server version: 5.7.33-cll-lve
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smantaka_siakademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `kode_guru` char(5) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `kelamin` varchar(10) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `status_aktif` enum('Aktif','Tidak') NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`kode_guru`, `nip`, `nama_guru`, `kelamin`, `alamat`, `no_telepon`, `status_aktif`, `username`, `password`, `gambar`) VALUES
('G0002', '201200002', 'Arifin', 'Laki-Laki', 'Jl. Kampung Utan Cibitung - Bekasi', '085678902345', 'Tidak', 'arifin', 'arifin', ''),
('G0003', '201200003', 'Bambang Harmoko', 'Laki-Laki', 'Jl. Kiasmawi No.10 Cikarang Barat', '085678902345', 'Aktif', 'bambang', 'bambang', ''),
('G0004', '201200004', 'Gunawan', 'Laki-laki', 'Jl. Ki Hadjar Dewantara No.41 Cikarang Utara', '086723456789', 'Aktif', 'password', 'password', ''),
('G0005', '201200005', 'Uswatun Hasanah', 'Perempuan', 'Jl. Yos Sudarso No.12 Cikarang Utara', '087890781234', 'Aktif', 'uswatun', 'uswatun', ''),
('G0006', '201500001', 'Hasbunallah', 'Laki-Laki', 'Kp. Wangkal Rt.03 / Rw. 07 desa kalijaya cikarang', '085694984803', 'Aktif', 'guru', 'guru', 'gambar_guru/Ni & Qo0777.jpg'),
('G0001', '201500002', 'Persada', 'Laki-Laki', 'Kp. Wangkal Kidul kec. cikarang barat bekasi 17530', '085694984812', 'Aktif', 'persada', 'persada', ''),
('G007', '196108291986032008', 'Dra.hj hafsah', 'Perempuan', 'makassar', '085702069431', 'Aktif', 'hafsah', 'hafsah', 'gambar_guru/user.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` char(4) NOT NULL,
  `tahun_ajar` varchar(12) NOT NULL,
  `kelas` char(12) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `kode_guru` char(5) NOT NULL,
  `status_aktif` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `tahun_ajar`, `kelas`, `nama_kelas`, `kode_guru`, `status_aktif`) VALUES
('K001', '2019/2020', 'X.MIA', 'Kelas 1', 'G0002', 'Aktif'),
('K002', '2019/2020', 'X.IIS', 'Kelas 2', 'G0005', 'Aktif'),
('K003', '2015/2016', 'XI', 'Kelas 3', 'G0006', 'Aktif'),
('K009', '2015/2016', 'XI', 'Kelas 4', 'G0002', 'Aktif'),
('K011', '2015/2016', 'XI.IIS', 'Kelas 1', 'G0003', 'Aktif'),
('K010', '2016/2017', 'XI.MIA', 'Kelas 2', 'G0004', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE `kelas_siswa` (
  `id` int(5) NOT NULL,
  `kode_kelas` char(4) NOT NULL,
  `kode_siswa` char(5) NOT NULL,
  `jurusan` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_siswa`
--

INSERT INTO `kelas_siswa` (`id`, `kode_kelas`, `kode_siswa`, `jurusan`) VALUES
(1, 'K001', 'S0001', 'X.MIA'),
(2, 'K001', 'S0002', 'X.IIS'),
(3, 'K001', 'S0003', 'X.MIA'),
(4, 'K001', 'S0004', 'XI.MIA'),
(5, 'K001', 'S0006', 'XI.IIS'),
(12, 'K002', 'S0010', 'XII.MIA'),
(7, 'K002', 'S0008', 'XII.MIA'),
(8, 'K002', 'S0009', 'XII.MIA'),
(11, 'K002', 'S0007', 'XII.MIA'),
(13, 'K002', 'S0005', 'XII.MIA'),
(14, 'K002', 'S0004', 'XII.IIS'),
(15, 'K001', 'S0012', 'X.IIS'),
(16, 'K003', 'S0013', 'X.IIS'),
(17, 'K003', 'S0017', 'XI.MIA');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(5) NOT NULL,
  `semester` int(2) NOT NULL,
  `kode_pelajaran` char(4) NOT NULL,
  `kode_guru` char(5) NOT NULL,
  `kode_kelas` char(4) NOT NULL,
  `kode_siswa` char(5) NOT NULL,
  `nilai_tugas1` int(4) NOT NULL,
  `nilai_tugas2` int(4) NOT NULL,
  `nilai_uts` int(4) NOT NULL,
  `nilai_uas` int(4) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `semester`, `kode_pelajaran`, `kode_guru`, `kode_kelas`, `kode_siswa`, `nilai_tugas1`, `nilai_tugas2`, `nilai_uts`, `nilai_uas`, `keterangan`) VALUES
(3, 1, 'P001', 'G0002', 'K001', 'S0002', 75, 60, 80, 85, 'tingkatkan belajarnya supaya pinter'),
(4, 1, 'P001', 'G0003', 'K001', 'S0003', 70, 60, 75, 80, 'tingkatkan belajarnya'),
(5, 1, 'P001', 'G0004', 'K001', 'S0004', 75, 80, 75, 80, 'tingkatkan belajarnya'),
(6, 1, 'P001', 'G0005', 'K001', 'S0006', 68, 70, 85, 80, 'tingkatkan belajarnya terus'),
(7, 1, 'P004', 'G0003', 'K002', 'S0007', 12, 12, 12, 14, 'lebih giat belajar supaya pinter'),
(8, 1, 'P001', 'G0002', 'K002', 'S0010', 78, 80, 75, 85, 'belajar terus'),
(9, 1, 'P008', 'G0001', 'K002', 'S0009', 14, 14, 14, 85, 'tingkatkan belajarnya supaya pinter mantap'),
(10, 1, 'P001', 'G0002', 'K002', 'S0008', 85, 80, 85, 90, 'pertahankan belajarmu'),
(11, 1, 'P001', 'G0002', 'K002', 'S0005', 75, 70, 75, 80, 'kurang rajib belajar'),
(15, 1, 'P008', 'G0001', 'K002', 'S0009', 14, 14, 14, 85, 'tingkatkan belajarnya supaya pinter mantap'),
(19, 1, 'P008', 'G0001', 'K002', 'S0009', 14, 14, 14, 85, 'tingkatkan belajarnya supaya pinter mantap'),
(18, 1, 'P001', 'G0005', 'K001', 'S0006', 68, 70, 85, 80, 'tingkatkan belajarnya terus'),
(22, 1, 'P017', 'G0004', 'K010', 'S0017', 80, 81, 82, 84, 'tingkatkan'),
(25, 1, 'P003', 'G007', 'K010', 'S0017', 80, 81, 82, 84, 'Keterangan lulus');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

CREATE TABLE `pelajaran` (
  `kode_pelajaran` char(4) NOT NULL,
  `nama_pelajaran` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`kode_pelajaran`, `nama_pelajaran`, `keterangan`) VALUES
('P001', 'Pendidikan Agama', 'Tambahan'),
('P002', 'Pendidikan Pancasila dan Kewarganegaraan', 'Wajib'),
('P003', 'Bahasa Indonesia', 'Wajib'),
('P004', 'Bahasa Inggris', 'Wajib'),
('P005', 'Matematika', 'Wajib'),
('P006', 'Sejarah', 'Wajib'),
('P007', 'Sejarah indonesia', 'Wajib'),
('P008', 'Kimia', 'Wajib'),
('P009', 'Bhs & Sas Arab ', 'Tambahan'),
('P010', 'Penjaskes', 'Wajib'),
('P011', 'Seni Budaya', 'Wajib'),
('P012', 'Prakarya', 'Tambahan'),
('P013', 'Fisika', 'Wajib'),
('P014', 'Biologi', 'Wajib'),
('P015', 'Sosiologi', 'Tambahan'),
('P016', 'Ekonomi', 'Tambahan'),
('P017', 'Informatika (TIK)', 'Tambahan'),
('P018', 'Bimbingan Konseling', 'Tambahan'),
('P019', 'Matematika distrik', 'Tambahan');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `kode_siswa` char(5) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `kelamin` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `tahun_angkatan` char(4) NOT NULL,
  `status` enum('Aktif','Lulus','Keluar') NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gambar` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`kode_siswa`, `nis`, `nama_siswa`, `kelamin`, `agama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_telepon`, `tahun_angkatan`, `status`, `username`, `password`, `gambar`) VALUES
('S0002', '2014002', 'Tri Sulistiawati', 'Perempuan', 'Islam', 'Cirebon', '1991-03-20', 'Jl. Lapang Bola 2, Cirebon Kota', '085698976543', '2016', 'Aktif', 'siswa', 'siswaku', 'gambar_siswa/male.png'),
('S0003', '2014003', 'Puji Astuti', 'Perempuan', 'Islam', 'Karawang', '1990-07-12', 'Jl. Johar baru, karawang', '085634125687', '2015', 'Aktif', 'coba', 'coba', 'gambar_siswa/male.png'),
('S0004', '2014004', 'Yadi Sembako', 'Laki-laki', 'Islam', 'Cikarang', '1993-02-15', 'Jl. Arif Rahman Hakim, Cikarang', '085745673214', '2015', 'Aktif', 'siswabisa', 'siswabisa', 'gambar_siswa/male.png'),
('S0005', '2014005', 'Asep Saputra', 'Laki-laki', 'Islam', 'Brebes', '1990-10-21', 'Jl. Pahlawan No.40, Brebes', '081923141234', '2015', 'Aktif', 'nyobain', 'nyobain', 'gambar_siswa/male.png'),
('S0006', '2014006', 'Hartono', 'Laki-laki', 'Islam', 'Yogyakarta', '1992-01-11', 'Jl. KH. Fudholi No18, Cikarang', '0819282828211', '2014', 'Aktif', 'cikarang', 'cikarang', 'gambar_siswa/male.png'),
('S0007', '2014007', 'Andri Wibowo Pratama', 'Laki-laki', 'Islam', 'Bekasi', '1990-06-12', 'Perum Gramapuri Cikarang Blok A11 No.3', '085798701234', '2015', 'Aktif', 'password', 'password', 'gambar_siswa/male.png'),
('S0008', '2014008', 'Agung Laksana Putra', 'Laki-laki', 'Islam', 'Cikarang', '1991-06-02', 'Jl. KI Asmawi No.15, Cikarang', '082123451234', '2015', 'Aktif', 'lupapassword', 'lupapassword', 'gambar_siswa/male.png'),
('S0009', '2014009', 'Ujang Aji Prayoga', 'Laki-laki', 'Islam', 'Medan', '1990-06-14', 'Jl. Pilar Timur No.16, Cikarang', '086723456712', '2015', 'Aktif', 'ajiajah', 'ajiajah', 'gambar_siswa/male.png'),
('S0010', '2014010', 'Nurlaela', 'Perempuan', 'Islam', 'Bekasi', '1991-02-05', 'Jl. Yos Sudarso No.18 Cikarang', '085612345678', '2015', 'Aktif', 'cikarang', 'cikarang', 'gambar_siswa/male.png'),
('S0012', '2015001', 'Rojak Saputra', 'Laki-Laki', 'Islam', 'Bekasi', '2015-06-22', 'Jl. Fatahillah No 45 Cikarang Barat', '086723451623', '2015', 'Aktif', 'rojak', 'rojak', 'gambar_siswa/male.png'),
('S0013', '20190', 'FAHRI', 'Laki-Laki', 'Islam', 'MAJENE', '2003-09-09', 'Griya ifah', '082327327527', '2019', 'Aktif', 'klik', 'klikki', 'gambar_siswa/logo.png'),
('S0017', '0053174083', 'abdul asis', 'Laki-Laki', 'Islam', 'takalar', '2006-02-02', 'takalar', '085702069431', '2019', 'Aktif', 'abdul', 'abdul', 'gambar_siswa/logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_suratkeluar` int(11) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `gambar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_keluar`
--

INSERT INTO `surat_keluar` (`id_suratkeluar`, `keterangan`, `tanggal`, `gambar`) VALUES
(2, 'kopi susu 12qasd', '2021-01-26', 'gambar_suratkeluar/202011241510551002.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_suratmasuk` int(11) NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `gambar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_suratmasuk`, `keterangan`, `tanggal`, `gambar`) VALUES
(3, 'surat', '2021-01-25', 'gambar_suratmasuk/202011241510551002.jpg'),
(4, 'Keterangan lulus', '2021-02-01', 'gambar_suratmasuk/logo.png'),
(5, 'surat masuk', '2021-02-09', 'gambar_suratmasuk/user.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` char(4) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `gambar` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `gambar`) VALUES
('U001', 'admin', 'admin', 'Administrator', 'gambar_admin/male.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`kode_guru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD PRIMARY KEY (`kode_pelajaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`kode_siswa`);

--
-- Indexes for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_suratkeluar`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_suratmasuk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id_suratkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_suratmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
