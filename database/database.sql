/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.20-MariaDB : Database - db_restoran
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_restoran` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_restoran`;

/*Table structure for table `tb_level` */

DROP TABLE IF EXISTS `tb_level`;

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(150) NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_level` */

insert  into `tb_level`(`id_level`,`nama_level`) values 
(1,'Administrator'),
(2,'Waiter'),
(3,'Kasir'),
(4,'Owner'),
(5,'Pelanggan');

/*Table structure for table `tb_masakan` */

DROP TABLE IF EXISTS `tb_masakan`;

CREATE TABLE `tb_masakan` (
  `id_masakan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_masakan` varchar(150) NOT NULL,
  `harga` varchar(150) NOT NULL,
  `stok` int(11) NOT NULL,
  `status_masakan` varchar(150) NOT NULL,
  `gambar_masakan` varchar(150) NOT NULL,
  PRIMARY KEY (`id_masakan`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `tb_masakan` */

insert  into `tb_masakan`(`id_masakan`,`nama_masakan`,`harga`,`stok`,`status_masakan`,`gambar_masakan`) values 
(8,'Sate Ayam','11000',13,'tersedia','Sate Ayam.jpeg'),
(14,'Sayur Asem','7500',78,'tersedia','Sayur Asem.jpeg'),
(18,'Ayam Geprek','11000',7,'tersedia','Ayam Geprek.jpeg'),
(19,'Nasi Pecel','7000',19,'tersedia','Nasi Pecel.jpg');

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_admin` int(11) DEFAULT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` varchar(150) NOT NULL,
  `uang_bayar` varchar(150) DEFAULT NULL,
  `uang_kembali` varchar(150) DEFAULT NULL,
  `status_order` varchar(150) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_admin` (`id_admin`),
  KEY `id_pengunjung` (`id_pengunjung`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `tb_order` */

insert  into `tb_order`(`id_order`,`id_admin`,`id_pengunjung`,`waktu_pesan`,`no_meja`,`total_harga`,`uang_bayar`,`uang_kembali`,`status_order`) values 
(14,1,9,'2019-08-03 12:43:52',1,'48000','50000','2000','sudah bayar'),
(15,1,1,'2019-08-04 16:25:45',1,'44000','50000','6000','sudah bayar'),
(16,1,1,'2019-08-04 16:35:24',8,'105500','150000','44500','sudah bayar'),
(18,1,7,'2019-08-04 16:37:58',8,'87000','100000','13000','sudah bayar'),
(19,1,1,'2019-08-04 17:17:09',1,'22000','50000','28000','sudah bayar'),
(20,1,6,'2019-08-04 18:04:22',8,'29500','50000','20500','sudah bayar'),
(21,1,10,'2019-08-07 08:54:23',1,'22000','30000','8000','sudah bayar'),
(23,1,11,'2022-02-04 18:20:22',1,'14000','20000','6000','sudah bayar'),
(24,1,1,'2022-02-04 18:26:23',1,'7000','100000','93000','sudah bayar'),
(25,0,1,'2022-03-30 13:45:08',1,'29000','','','belum bayar');

/*Table structure for table `tb_pesan` */

DROP TABLE IF EXISTS `tb_pesan`;

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_masakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_pesan` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_pesan`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Data for the table `tb_pesan` */

insert  into `tb_pesan`(`id_pesan`,`id_user`,`id_order`,`id_masakan`,`jumlah`,`status_pesan`) values 
(33,9,14,14,2,'sudah'),
(34,9,14,8,3,'sudah'),
(35,1,15,19,2,'sudah'),
(36,1,15,14,4,'sudah'),
(37,1,16,19,3,'sudah'),
(38,1,16,14,1,'sudah'),
(39,1,16,8,7,'sudah'),
(43,7,18,19,4,'sudah'),
(44,7,18,14,2,'sudah'),
(45,7,18,8,4,'sudah'),
(46,1,19,19,1,'sudah'),
(47,1,19,14,2,'sudah'),
(48,6,20,8,2,'sudah'),
(49,6,20,14,1,'sudah'),
(50,10,21,18,2,'sudah'),
(52,11,23,19,2,'sudah'),
(53,1,24,19,1,'sudah'),
(54,1,25,19,1,''),
(55,1,25,8,2,'');

/*Table structure for table `tb_stok` */

DROP TABLE IF EXISTS `tb_stok`;

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesan` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `status_cetak` varchar(150) NOT NULL,
  PRIMARY KEY (`id_stok`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tb_stok` */

insert  into `tb_stok`(`id_stok`,`id_pesan`,`jumlah_terjual`,`status_cetak`) values 
(1,46,1,'belum cetak'),
(2,47,2,'belum cetak'),
(3,48,2,'belum cetak'),
(4,49,1,'belum cetak'),
(5,50,2,'belum cetak'),
(6,51,0,'belum cetak'),
(7,52,2,'belum cetak'),
(8,53,1,'belum cetak'),
(9,54,1,'belum cetak'),
(10,55,2,'belum cetak');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_level` int(11) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id_user`,`username`,`password`,`nama_user`,`id_level`,`status`) values 
(1,'rafi','123','Rafi Chandra',1,'aktif'),
(6,'hendro','123','Hendro',2,'aktif'),
(7,'fitri','123','Fitri',3,'aktif'),
(8,'slamet','123','Slamet',4,'aktif'),
(9,'sugiastutik','123','Sugiastutik',4,'aktif'),
(10,'topik','123','Moh Taofik RR',5,'aktif'),
(11,'selpi','123','Selviana Ariani',5,'aktif'),
(12,'kesi','123','Sukesi',5,'aktif'),
(14,'abdulaja','123','abdul',5,'aktif');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
