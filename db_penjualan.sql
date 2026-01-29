-- =========================================
-- DATABASE & TABLE (DDL)
-- =========================================

DROP DATABASE IF EXISTS db_penjualan;
CREATE DATABASE db_penjualan;
USE db_penjualan;

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    email VARCHAR(100),
    no_hp VARCHAR(20),
    alamat TEXT
);

CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100),
    harga DECIMAL(12,2),
    stok INT
);

CREATE TABLE penjualan (
    id_penjualan INT PRIMARY KEY,
    id_pelanggan INT,
    tanggal_penjualan DATE,
    total_penjualan DECIMAL(12,2),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

CREATE TABLE detail_penjualan (
    id_detail INT PRIMARY KEY,
    id_penjualan INT,
    id_produk INT,
    jumlah INT,
    harga_satuan DECIMAL(12,2),
    subtotal DECIMAL(12,2),
    FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- =========================================
-- INSERT DATA MASTER
-- =========================================

-- Pelanggan (ID 4 & 5 tidak belanja)
INSERT INTO pelanggan VALUES
(1, 'Andi Wijaya', 'andi@gmail.com', '08123456789', 'Denpasar'),
(2, 'Budi Santoso', 'budi@gmail.com', '08234567890', 'Badung'),
(3, 'Citra Lestari', 'citra@gmail.com', '08345678901', 'Gianyar'),
(4, 'Dewi Anggraini', 'dewi@gmail.com', '08456789012', 'Tabanan'),
(5, 'Eko Pratama', 'eko@gmail.com', '08567890123', 'Singaraja');

-- Produk (ID 105 & 106 tidak terjual)
INSERT INTO produk VALUES
(101, 'Kopi Arabika', 75000, 50),
(102, 'Kopi Robusta', 65000, 40),
(103, 'Teh Herbal', 40000, 30),
(104, 'Gula Aren', 25000, 20),
(105, 'Coklat Bubuk', 30000, 25),
(106, 'Susu Almond', 45000, 15);

-- =========================================
-- INSERT DATA TRANSAKSI
-- (hanya pelanggan 1,2,3)
-- =========================================

INSERT INTO penjualan VALUES
(1001, 1, '2025-01-10', 150000),
(1002, 2, '2025-01-11', 130000),
(1003, 1, '2025-01-15',  90000),
(1004, 3, '2025-01-18', 100000),
(1005, 2, '2025-01-20',  90000),
(1006, 1, '2025-01-22', 165000),
(1007, 3, '2025-01-25', 145000),
(1008, 2, '2025-01-28', 265000),
(1009, 1, '2025-02-02', 230000),
(1010, 3, '2025-02-05',  65000),
(1011, 2, '2025-02-08', 175000),
(1012, 1, '2025-02-12', 130000);

INSERT INTO detail_penjualan VALUES
-- 1001 (150000)
(1, 1001, 101, 2, 75000, 150000),

-- 1002 (130000)
(2, 1002, 102, 2, 65000, 130000),

-- 1003 (90000)
(3, 1003, 103, 1, 40000, 40000),
(4, 1003, 104, 2, 25000, 50000),

-- 1004 (100000)
(5, 1004, 101, 1, 75000, 75000),
(6, 1004, 104, 1, 25000, 25000),

-- 1005 (90000)
(7, 1005, 103, 1, 40000, 40000),
(8, 1005, 104, 2, 25000, 50000),

-- 1006 (165000)
(9,  1006, 101, 1, 75000, 75000),
(10, 1006, 102, 1, 65000, 65000),
(11, 1006, 104, 1, 25000, 25000),

-- 1007 (145000)
(12, 1007, 102, 1, 65000, 65000),
(13, 1007, 103, 2, 40000, 80000),

-- 1008 (265000)
(14, 1008, 101, 2, 75000, 150000),
(15, 1008, 102, 1, 65000, 65000),
(16, 1008, 104, 2, 25000, 50000),

-- 1009 (230000)
(17, 1009, 101, 1, 75000, 75000),
(18, 1009, 102, 1, 65000, 65000),
(19, 1009, 103, 1, 40000, 40000),
(20, 1009, 104, 2, 25000, 50000),

-- 1010 (65000)
(21, 1010, 102, 1, 65000, 65000),

-- 1011 (175000)
(22, 1011, 101, 1, 75000, 75000),
(23, 1011, 104, 4, 25000, 100000),

-- 1012 (130000)
(24, 1012, 103, 2, 40000, 80000),
(25, 1012, 104, 2, 25000, 50000);
