-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2019 at 09:10 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` char(7) NOT NULL,
  `id_penerbit` char(7) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `harga` int(25) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `id_penerbit`, `judul`, `pengarang`, `photo`, `harga`, `jumlah`) VALUES
('B0001', 'PT0002', 'Goosebumps - The Haunted Mask', 'R.L. Stine', 'goosebumps - the haunted mask.jpg', 25000, 2),
('B0002', 'PT0002', 'Goosebumps - Night of The Living Dummy', 'R.L. Stine', 'goosebumps - night of the living dummy.jpg', 50000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detailpinjam`
--

CREATE TABLE `tb_detailpinjam` (
  `id_peminjaman` char(7) NOT NULL,
  `id_buku` char(7) NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`nama`) VALUES
('IOP'),
('Mekatronika'),
('PFPT'),
('RPL'),
('SIJA'),
('TEI'),
('TEK'),
('TOI'),
('TPTU');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbit`
--

CREATE TABLE `tb_penerbit` (
  `id_penerbit` char(7) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penerbit`
--

INSERT INTO `tb_penerbit` (`id_penerbit`, `nama`, `kota`, `phone`, `email`) VALUES
('PT0001', 'PT. M&C', 'Jakarta', '082119793970', 'mc@mc.com'),
('PT0002', 'PT. Elex Media', 'Jakarta', '082119793972', 'elexmedia@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pinjam`
--

CREATE TABLE `tb_pinjam` (
  `id_peminjaman` char(7) NOT NULL,
  `id_pustakawan` char(7) NOT NULL,
  `NIS` varchar(9) NOT NULL,
  `tgl_pinjam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pustakawan`
--

CREATE TABLE `tb_pustakawan` (
  `id_pustakawan` char(7) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pustakawan`
--

INSERT INTO `tb_pustakawan` (`id_pustakawan`, `username`, `password`, `nama`, `phone`) VALUES
('P001', 'admin', 'admin', 'Kelvin', '082119793970'),
('P002', 'david123', 'david123', 'David', '082129515805'),
('P003', 'aldy', 'aldy', 'aldy', '091986201');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `NIS` varchar(9) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `tingkat` varchar(3) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo` blob NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`NIS`, `nama`, `jurusan`, `tingkat`, `kelas`, `email`, `photo`, `phone`) VALUES
('111111111', 'David', 'SIJA', '2', 'B', 'david@gmail.com', 0x89504e470d0a1a0a0000000d49484452000000500000004b0806000000e70000f5000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000023bd49444154785eed9b677453d7dae7e7cbacbbdeb566bdefdc9b4249e8252490984e0284968450022481502f25241048081092107aefcd0642b73118771b77e36ecbb2d56555abd892bb2d3720b9b9b3e6c3ac99f9cff36cf91861843190e49d0ff7c37f1debe89cb3f7f3d3d3f696fc5feefef20ffc4bcfae7f017c4efd0be073ea5f009f53ff02f89cfaff0a60ebfd5fbb247ff7fe67e93f0da03f30ac967bbf742a7ff7b0fc8df167e84f05d8d1680652dbda08558305b25a0394753618ebabe0f034c0e569869bc44796ddd30843430d14750e14d41ae91eabb8d71f547f63ff51fa5300fa1ac7069735d7a0a0ce007dbd0be5f58d5e588d2d9dcad574f72155b6fe0a477d0b34b56e026a10cfec08b3e33cae78b2b0ac3210135c3b48dbb1ac2a10571ab21eb9ee69f48702f485c65293a769ea9c7011908aa65601a6aaf99e5047601dd5116039c173795ac5bde50d4de243d0d4d9c518d278d2f8d6bbd558e23e8531ceef31dab1e591e3527a8faff167c393f48700ec084ed56086b1a1421859dd7abfdde3f8c862001d817554478055cdbfa0bae557f14148f7f3915552ef16212e8dbfa8fc1846946ec448d288d26fdb8e0fbf5e5476ccaf2d4fd2ef0ab0233867530d340d0ebf1e2679200394fe96cef3f57c94008bf7f9192486e7a8a7f36dc732f24267c3a380f93d3579fbc9ca580cb77c8d00f37a0c37b71d1ff3fa624daa5fbb3ad3ef06d0175ef3ddfb28ac2b81b3dee385d1f228c032ca7dec8dfc3e1fd9736aeefe22e4acf5089556d50af1dfb5bffc13d5f77e13102b5a7e11395082c7c78e0025cdb3eec39b863518467ad271be6dbf5fdb3ad3ef02b0233c459d454061553431bcbb8f00943cabf69e370c6fc42560f5b79b3164d458bcd0bb9fd07ff4ec25c47f0f1c31068bbe5c8fcb11b1c2bb24900ccf5ed784b2a6fb6dbadb26efebb7745f62a8ee73bc41f21e573df67580fe4bbff675a6e702d8115c758b87f28f8bc0718ef216072fc407212a89cff1fb7b4f9cc6c08091f8db2b7df072effe78b9df4074eb3f4840fbefaf78f542af01746e085eea3b087ff95b37bcd47f30befe69a7f03ef644f6b472f2725fd9eb5b51d1fa1b86aa576288faef788d248eaab6a39fd7c334abfcdad9999e19604778ae965ad83c35a86e6e15aa6af1aaa29544063130167b0c87626c7a36868c7c1b2fbcda173d08d8cbaff6c14baff41620ffda83bc8ea0fdedd581f88f1efdf0ef3de87ccf7ee2fc8bbdfaa1e7a021f8abf0ca51b8959a8e0a1ebf893e94368f94f2256b967e2b062b166310e949c7b9869ffcdada999e09e0239ed7ec81839adc5a02e40fa0f89b8ce1fcc6217be0c419e16dbd06905711b4177abc8217bbb7a92783ec8b175ee94fd00690070e10105fead91f7fedf6aa80c8f7bed47700ba0f7a032fd3330e9e3d8ffa7ffc0f02e6fd707c011e754462807c01fa17ce7fe231a83cc6afbd9de9a9017684d7d872975a14773bb88e00db413634a3aab1152bd67c855efd0760c0a0c1e8d5a7375eeede0d3d7bbd8a9ebdfba047afbee8c91e49def662b73e7891c0b117b25eec31002f74a773af0e40cffeafe3954143d173e030bc3a2480bc710096ae59d7eee1ec89be10a7ab37a16fc13cf423f5cd6f3b76783d93ae61bbfcd9dc999e09a02f3c45bd15554dd4df7502905f9b1c6598f3c902bc31e475bcf5da204c1b3f0a1347be8149a386e2cd41bd316cc8000c1ed817fd0866ef9e3dd0e3c597d1ad5b0f74efd95b40edf6f22be8d9bd2ffaf61b82d7df1c89a10163f0f6a4f7f0c6f031e8fbfa30f47f733826cdfc0836aad85218736ee4a39c967fef177f83deb9b3d12b67d623c70f951b60f094fdf1001f82d77a8fd6af7ad410c48ec084082a8bdfd7982c9832f503040c1d46d08661e3b27908dcba06d7f66dc4b6e53371f09bc5d8b56e293e993a06a307bf8251837a60f8c09e18dce36f18ffd6eb58357f2ed6af5886b5cb9761d3da35d8f5e3f73876683fc26f8460d78ead983879225e1b3e02bd860cc592b5df785b9856ca8774e442c310cb9a5b70c0720353e5ebd0377b366916de2b5a871f8c81c216b6896d7b5a885d06c80f66f1404d34a0dd5345a01e785e4780b5748d0470e1b2bf63f48891181f300c813b36c198160657f62db83342e1caba0173c22568622fa028f267a4879c4054d05e04ed588f333bbec68de3bb7027ec22526e5ec19de850e42544439e9e00656e1ab4f26ca1d0eb9730f29d77d09b3cb1cfb011088d4f46d5fddf4435666f64a00c50882b36ad622aee521f497fdb1b9b842d6c13db26d9e98f813f7509a0f450fe8478200f0153d7dba845691180042c82d65e30489534b1fa7bf771feca35bc191080d1435fc3aa39efa124250c35b238d4e547c2957e1d65776ec0917103daa833d045074115190879d84914470621e7fa0964041f43f6cd20e4c68420fff62dc8d362509c190f6d611a8cca2c18d5d930eae5f86ac3d7a21d1a307c34e62c59013be55c8624bcb1234002eb6c945a9e5628ebedc226b64df2c2ae42ec324029743d044c5967263804eefeddc786309f63809f2d5d8651c303308d72dd9503dfa34a761b75b25834e447a1363702eeac5bb0a585c09e7c099684b328893e0365f87101b3f0e6710153157701eac460c8e283214f0a852e271e3a5932795f0af48a4cd82c2a844545500e9c859193a7a22fe5c8c8f42ce185de5cd806cf07207ba1938a9aa399c29c22a5986c62db9e36949f08d0171ee78a069a8cb5b14a80f355354d540ae7ea66ca7f04d160b309ef9b3836007f9f35117911e7e02678f545f16890c7901786a332e706cad2afa2f4f659a8c38ea038ec2834316708de61a8224ea138f4280a830f21ede79db873753f8ae22ea2283104eacc18e80a5261d5e4c361352023371bcbd7af47c0bb933160d4387cbb6b9ff0406fa3fd009e0450fa5b88ded3d5bb856d4f9b0fbb0c500a5d459da93db77506b096bc2f262909c3038662fac4d1d8f9d522a86e5f46ad3a19d5c514c24531a8ce0f437966086c4917511c7210a9677e40c2a9cd48bbb01dd957f720efda3ee412b894935bc47ba9e7b7a3202208057197a1488f1600ed14be4e5b09f4e6126c3b7400d33efe180193a661faa2e56235220a4863f343c01e014862c86c5bc750f6c7c4579d027cc8fb08523d4d445bef78049e17a0179e14c2f5bffe8ae341673076cc5bf86ce6141cd9b212daa46ba8d3a4a04e95889aa238541544c29d1b06677a30852de53d0ad9ac2b7b91726e1b12cffc8894a09f84f7e55dde473a805c2a30cac41b28be1347452405bae22c941af2e1b4aa60b19b7031f43ae62e5b8609b3e6e2f5f153a02dabf2e6bfae006cf907a52697b0916dedaa177609207f220d04a794dcdcb73de90c60ddfd5f70f8c4314ca17eef8bcf3ec4f5633fa1bc803c8f00b21756c9e3c913291f162710ccdb28cf0a8331f112941167507ceb94c87fa9e7774243454579eb34898e3157612070fac25ca88af2a153cb506a2a84c3a684b9d488e894642c5bb70ed33ef90c03468f476e8945c01221ec03cb1f402e2abcf9c036b2ad5df5c2c702ece87d75f4c9c86a4bda617504282de3da3d908accf69ddb3063ca18ac5b380311a7b6c355180b8f3e0335ca14b864f1a85224a156952a54961b0d4726179450e829cf99e22f233fe418ec1961d02750c8465e40495a34d459a950caf290959d8102590e2c16258c862258cb2c50180dd8b26f2fa62f5c8a80291f202e4f2ee0f05adc171603ec28f6540ef7bc1a83b0b5ab5ef8448092f7d53634c2ec79b064f3079025016cb87f0f070eefc3e279d3b063ed0218336e0acf6bd0dd41ad360396ec2814c55f83820a42d2d523b871ec47dc3afe03e4b7b895390b6b52300aae1f87332742e4ce5bc7b661ed27d33163e238cc9b391d9f7ffe39e67e3c07db776d85898a88c56185b9bc0cc9f9f9f86aeb0e4c98f329d2953a01e7490045a5f650981338bda75ad8da552ff40b906f60f9e6beb2da6a5452e872cfc77a0420178e0e0077efdf492b8879d40c6f135ed66ace16008be3af60e9fb2331e7ed219812d01b6ff6f8370474ff0be68dee8fad8bdec7f94d2b50147a1ab1c7b60a7809970f61e3d2599837999af1e1433074505ff4eedd1b6f8d1c8551e3278af5b542af81b3ba02c68a0a7cb7ff30a6ce5f8c4c8d51ac487893e1490079db8dafe3d6866df5cd85120f7fac1e0b50781fddcc55a9d6d384a26aa3f03ceeedbae2811cc2878fecc7fabfcf450a35c31cbabf5a65288af9192b3f1889ef96cdc4378b3ec48a7993b175ed2204eefc0657f66c42f8c1cd38b77139124e6ca3a2714a34d1693782107df9384eeefd1e07767c8fd06b9771f1e24504fd7c4134ea3fedde8ded7b76c35ee182d1e5c28f878f90077e8c54855a00ea4a080b2f6c7b5f5e6b16368b8afc8430ee1c20872f25e0ea7a8f58f7d6de2570bcfae8280258d77c5f8837537985e2f9f52ece9d3f892f174e476ef859b418f304c0c4b33ba1a51ce792252037e222f67ff725ad81c7e1bd807e98f1662f1c5fb710f6a410dc55df813afa2a6cf9a930c9d2b172fe8718fe7a5f8c08780b83060dc2d8b7c7538edd81ec9c34a835725cbf790d56a71d36b71bdb0f1dc5d4b9f3a1b039c5ce0cf782fea0f9ca0bf73e35d6f7915b4bce4236b3ed4f0ae34700f2852cdff0adaa6d80b6a1d43f3c96f0c2fb420cb0a6b509cdf75b90921885e5732722ebc6693499f2d062a0b52bc1e395c7b91f5660ddec7790177909afffedbf62f1e41118d7fddff0dddcf170a686c0234f802aea32ac39d42cd37a77f5c28fd0a7dbbf63d2b8317863d0402cfa6c3e8e1fdd8fd52b17209f2027a6de86c16a81d35d811f76eec64caac4fc5d0aef0f32447fd07cc5e024c9ebca84cd5d0963bf009938dfe4a1650ebb72654d3d4a1b2b1f05e72b1ac8fb3d0879634b0bee357b1076f114befc780a0aa32fa0c92243a3390f1e4d2a9a54496213a12e2f1a3917f7e1e8971f63d93baf61c99801b8f0ed1294a75c43351519aebca63bf1b0cab21075e50ce64e1e8d196fbf89cfe7cf42c8d963d0cb3361292984562383d1a44399bb0cee9a6a6cdbbd130b972f47566191981387a63f68bef205a8f7d4099bbd61dc79357e2c40a9fad650457257d7c2d5dce01f5c9bbca1eb85d8404ba32a9b1965ca5c1c58bf9820dc424ba91cf5c61c541425c0991d26d6c115a957a10e3e80d4a39b7063db17b4ead88baaf450d4504fe8be731345e1e7a9f98e82252f0de6fc14c45e3e81b3dbbec6f1cd9f23eafc61b1b1a02bca81a298fa427511ec6536545497e3c4e913888da7665b4755b8a1e9a93dd04a9ec736b3ed4faac69d036ccb7faeaa1a2a0cd43cfb012789f35ee55d2f400fddd7ec76c0adc8460e150057fe6dca8105f0e87250a74c178d33af40ec2917a0bb7510256107618d3a0d67fc05d467de4003b52ece94505a9dfc0ccded301832e251a3cda382720e71277723fed41e245f3886ccc8ab28cc4a42895e092b35d26504d0e92ec56d4a1d0eab097abd9e0adebdf6ad2d5ff91615962f403bbd669bbb9207fd026ca68bdbf35f5d03ca2aaa51dd25805e4ff43437a1a5a20cb53a199a0db9a855a4e19e458e56931c4dfa3c6a653251a348803e3e08fa88a3d0dfdc077dc85ed8228ea3fe4e086aa8676c2ca41c1871018a98eb2893a5419b7813b703f721e2e00f483cb51799c181284c08879ac2db64d0c2e1b4a1d46682dd6980d9a4406d7929dc748e5b2e6e659e06a0a389de279bd9f6f63cd815807c8100d85640b823e764ea74577509a0a40602d85ce382a338130d2559b0e746e1ae558e664b119accc568a4e51737d3eebc2868234fc214710c866b3b90b267156ad3afc095720535f9b1d4549f83222a84d6ceb9a82a4cc137b327e2fce62f90f6f33114445c873e3b1d468d0256b3096e6aa25de576b82b2d48ba7d036e9306e574bec2d3888a5f9ece031920dbccb6fbae4a243ebecc1e01c8ae2a0a08036c2b200e57659742d81760638d1b0e32dc9a130d5b4e241a8db96830ca50672e126a32534e54dd41052dd58cb78e23eea72588dc321fea6b7b71feeb4f509a700d85a18190475ec3da59531173fa007ea44abc75e12cdc3abc138adb11b014e5c16e32c04ed5d755e62480a528b5ab91911681cc981b705073cd3dab9dfad3a701c821cc36b3edcca0b37dc2c7036cabc0153575f4b00ab81aeb6932bc85efd5e3017aab70737d1dcab4c522075ad26fa28efaba565af47b4a1568726ad0682da28a4c5e480526f5e877483db201b6e85330845175bd7502b9e7f72339702f827e588ff0d387117bee0cb243837172c397d402ada7869c0029f36133eb617794a28a9ae8f2322bad8b0b515c908ccb27f6a3c6cebf21e402c1801e1643f5952f402e226c33dbfea44adc0940ef0aa4a2ba0ef6f20a583d954f05b085546ea4dc949f48ebd9185aca6578bd8e0036d8956875a884079644fd2c00720171249c43e1a55da43dc83cb30bc13f7e85d07d5b7165df4e1cfeee3bc45fbd82a284085c3fba1b2107b78b2a2f0052f1282f770a80252532e467c5c154948d2a022879e0d300e436866d66dbbd005b9f0ea0ef124e02a8ae2fed14a02406c8c7fa56ca9f6e3baab40568d066a39a00d696e4a191bc904398f3a13d2b1a45212750997a0325bc65157248e4bfaad4eb30049f44d6f13d28b87406ead8701427272325260221174e88ef4442c9c3f4592928356909a0156e77b92822965215ca1c7a34b86ca82e7388ad3769ebbeab00e575ce47003e6e49d76580f9d5ba2e03145ef80bef60d7a3c2a040993c1d15aa4c54124806586f94a3d12083392d0c8ee4eb50841c83f2fa71f13d49c1e57d4839b299f2e16ad25adcd8b21e57b76e46c8c96328cac940427428c22e9f81f64e22b2a2c3506ad01030abf04001d0aa87c5ac85d36c444d55b5581d3d2dc0ec6acaabcf03d05f08cb2a340210af87ab9a1a1f82c9e28d040e17693381bfa1f3dc6f45a5dd08790a1592e254d4512fd86253a3c12047ad320b95f9d454a7dd40e4fe6ff0c3dc09883bbc05c5c187618e0842f2ee0d48dbbd0949fb7e447ae031245cbd80b387f662e99ce9d8b3793d14a909c84f8aa134a14785c3067ba9496c6bf1c66a5a461a012d475d032de5a82ff5168927032ca3869b8ff915ba47003e430e7cb888689d14c204d01fbc8e00c50f8a487cbea5d5835f9aaa602e4e43ad5926bcaf5a4315599b8b1a79324a93437071f372d8526ee03eb536ad0a6a8c299cd30f6d41d6e1adc838be13bac860d86594d34c7a38b445080e3a8ed8eb97c4ceb4595324bcd0eeb0c062b388ef461aa91f755593f75131e09f7bf04e4b4788fe00b2ecd4c2b0adcf5f443ab431669b1396c60a2f2cf2425f785ef1399fef87e9391cca0d64ccfd7b1e58d559a836e4a15a9f4ff93007b5d423d615a5c0911a0a7756045a54e968222fadcc098726ec2442bf5f8e1d73c6e3f4da8548a5659b2a39067655211c46352c7a056e531fa853e453c86aa1d41408efb352d1d0515b534fe3f3f7d2fc8326f1dbc42e026478ea3afab0c9d6676e63587c71c7469a1f9a57ad7dac070aef6b032820d2a4bc9b0bd417b6d4a3c645614190b890d4a8a9a8505e648015d46457e6c5a0519d8e6a5a7db8a967d4459f43fca1cd08ddbe16d1c7b789259c22250edabc4c28e5e475d424ab1579d0690ba1a55587daac80d96e82d6a813db592e6a9edd341f0627e94900199ecd731759957a61eb3335d22c019048f34dbe4b39aba31cc576bd77e7d9079cf45a02c7f27ae383d7b5cd0d686c7042436b62978a42599b85f2fc64d46bb260cda055037fd14ecb3bd117124cc3edcb90859ec29d4b4790713d08f2dbe1d0e5e7c0ac2670c58590cb7261204f546aa8e7a32aaf3215c3506a804c5d84724f3d9ce4350c8cc53b31fca51217125f60b6c69687544a9eca2ab697085b9f6929c7e28bd8553b6e26943a5d28b1d8a0af77740a5082e70bb1baa591fac21ae88b52612b4c44a53205e5723a16270b78ae8218d469d2bc2b93fc381812af2027f838922f1ec19d50ea0d9362a12c288046a98152a9844c5e40de467f1b5428d4ca50a4977b5f97680856535bd5f5fec4b7cb001b5a515ce7b5916d7daecd8476800440daceb297bb61b4da915bae7a089c04f301c00770a5f37cbcdbe2115f829bf2a261c9b905474114cc99d7a18c3d0755dc7958d2ae8b6fe04c4957a0083f2d76aea34e6c4354d07e24debc8cb4e414c425df41724636e2d25249c948cabd832c65010a754590537129a14aeca6b19e09a0a719d9641bdbc8b63ef776962824942bb80af91612add10c5383ab033cdf10a673e4712ce93c57e8c6863a5496d2aaa12801dad44b50269d873ce63472420fe1c28e95b8b07505228e6e125faa279ddb810bdbbfc0918dcb7160d3e738b2eb071c3d751afb4e06e1e0e9b3381014846b319188c948414a6116f269c958a891c35c56fa1040feaeb7ab00b5543cd836df02f2a40accf20b90251512910729994a79506fb622a74c89ca860601b0a2b9b14dfcf783d7ee268f1726af4c1a2984a9f8d4979b044087ec16b46917a0883f8382f0a314aadb11716a0b2eee5a83ef164dc2dab963b164da087c34f14d7c346d1c3e786f32662f5888bd81e771fe563802434270eee67544a62721ad2817d92a194a6c0638aaca09963784392425805c50381f4ae0d8dbf86fe9c8e7b29c4a615b7bfe239bdbf3df630a08eb11802cbeb03d8c7df2a0adcc0d83d5067589119ada526a15e87c638300c69ec8ad839b0ce036863d41ac4a68f27504afd153811aa71a6e4d0a2a55b1a8d250b148bf046d6220f4c9e7a14d26a071e79013760c51813b70807ac3af967c8435ab1661d3f7df12b46b38171e8ed0c40484a724212c294e8430c3535bb4b055d8494eb1a9ebadb85e0fe4df074a45c51720cb52e711afe5b54e6113dbc6367635ffb13a0728c2d8bb22619776baa530b6a0c0a426700ccb1bc2621947d0442b43f756d3339afef93fc539ae90353566b8ac79a8d4a5a046970057712c1cf96130a65d823ae10c0c14d29ab840645d3f88e44b7b706eefd7d847cbb9bddb3661cf811d3876f11c02c3ae23940a4a44da6d24e5a521439e4d854401abcb0c67854300b4d753baf15058524be21bc2fe3c50fc4de70ba82d629bbced8b6ff83ec7d79a2cdf30aea64fabbcf2413556e98dc8722b85a78955075dcfff4da477d520a9408d6b5149d8baef08a6cffe1067030fc0449e57ae4f44ad21899672a9a8d7a7c155484bbcec1058ef5c812ee12c646187917a613bcefeb81487362ec6a6d51f63e3fae5f8f6bbf5d875ec00ce8605e3faed482464a72057952baaafc9aea390b3c2e63409885a2a24ceba5a982a2b515adf84f2d67fc2fddbff82b9f53794d0dffa96dfa06ffa074c54606cd4fbddd2660a5ba4eacb36b2ad5d095f965f802cbea13d8cd90ba922f1daf04131b1a058a34741950957e352b164c3368cfcf0334c98f3778c9fb50463a67d8a291fccc3e6f5ab505d9249e17a05f6dc6034ea13e0294985474f8db4260995b24802780dfac49f61a4304ebfbc135776afc6fe0d0bb065cda7d8f0f5726cdbf3134e5e3a8be0e870c4662421879a68558902252625e5ac1238ca4a50ee3689a346572836140a68953273e112acd9730a73361fc2f7616988abf927925afe0fb2eefd5fe8efff6f9c2bc8103648dec7b689f56f17aaafa4270294bc50ac4aa8b12cafac169f94813e31ce1b7295165357acc484792b3169c11a8cfe7029267cb48a002ec098b7a7e0d2d11df06893d1a08c82a738120daadb682ea1665a9d8c3a55b2f8999b3bff169cd937604ab92cbe27c909d98f6b47bec5b19d6b71f2f82e04fd7c12d7236f22fe4e92085bf63c8db118a652ca7d0e9d80e7721950556586c3a686d5aa22203a84c4c5e1b5f717a2df475fe1af73d6e285455bd063f51ebcfeed31ac098d157317b9afddfbbccdb3efeae39901b2fc7aa1d85cf07aa1ce6481425b821c8d1a1fac5c27c08d7a7f11a67dfa05464ffd0463c6be8be013bb68c59184166d126a645168d191f76952bd00f9a76eca0454c8a3e0c8ba0957ce4d58a9c551449f46dad58388bf7a1411c18148a095c86d5a0ba7e6a6204f91430d732119ad6af73e97cb84ea4a2bdc65d426114047392d1b1d26045e0d41aff173d0edfd2ff0f2673fe0bf2ddc86bfccdf8a3e6b76d19c5562ee6c43bbf7f1e6c153781fab4b003be642a92273d3a9319851a4d6219b7ab1a98b57e39d194b3169f60a0c9f341793a67d88dd9bbe44ad2e9d966e51c2db9af4a9a47434ead2485e806e5934ad40a244136d4a22805181c8be412b919013488bbc82f4a470a4a4c5223337193905e950e964c2fb186019795e65850515e5160268208fd450234c5e45b970c9da6f3168ea62bc346d15ba2fd88abf2edc8501ab76208be6ca73e6b9b30ded95b743ee7b6e802c5f2f6cafc8b5f594b8ab6075968be42b857296aa18b356afc3c499cb307cf2271839713a264f18277e8e5bada5a59a2e5984af08695522ca73c351af48406541acd84470dca1aa4c10f947e5d961b416be1584ecb86bc84d8d444e563cb2739350accc868e3c90779e4bed5a01abdc654155a503956e3b79a41136970de1896978ed9d19e8f3ee67e8f91e79e0cc8d18b6f27b3147297479ee6c03dbc236b557de2e7a1fabcb0085177228534b5053ffa0a058ec65a20155ea0c626279454aacdebf0d63df9b8fd1533e42c08871f874f64c188ad2e1292d4483295b14100eeb6a792c3c6a0aeda2dbe48131e26b4e5bd62de852698997148c42fe657e722864e91190e5de4641410a74ba3c94188b1e02e8745b602f3353fbe1a639952343568cb7677c868113e7a1dbb8f9e83f7d0d16ecdd23e6c673e4b9f29c79ee52e1609bd8b6dffd47e62c5f88bc37e61bcabc73ebcd875e8885b4e0e7899e4a0841c084197873f4548c1e3b15a3468d41e0f1c3709b15a8b314a2d1982d4298bdb146e1fdb9af5b1e87b2c27898299c4b72a3a0cebe054556385479b150cb13a12a4a81c95000b3f95180ee2a075cb5d5b81a9e8021e36662f03b73d163e447183c731d0ec5878839f1dc788e3c579e33cfdd37743bdbf77b9cba0c50822885326f34f272c70bd1dd5e547c3d315d5180b95fadc188f1b3316afc0778e3ad517877c2041cdfb70bc642f64885d81f74abef0895a9d36053a6c1a24845893c199ac24468e54930a8d2a15767a04497237e7560b2a829c7e961a44261a670b55694e34ea10c7396acc2ab432753e8cec7e0090b306bc3669a83ec21cf938a06cf99e72ef6fcfc84eeef0a90253d943f211e4854e53688dc7c3e80f8209cf38b55c82d2c4670de6d4c5eb018016f7f80b7c6bd8f3702262060f83b58b162352e9ea5063a3b1dd61225ec56aa9ea4525ae5984d2a186995c1e2bfada53ad12cdb5c0ee8ed3658aa6b916fb4e132f5a073bfd888ee0193d07fdc6cf4193d07633f5d8d6b39f1626c9ec3037892e7b9c59c79ee6c835475d9b6a781c7ea3240163f580a65291ffa83c8f9859334573a99428d3cb902d90545b89a138b0fbf588361145ec3c6cdc25b6367e0f5b7c67bfffb72c4688c7b7732a6cd9c8d0fe77c8cc52b3fc79a0d1bb179eb36afb6efc4a61dbbf1ed8ebd58b3750f662d5f8fd726cd41f71153d17bc21cf4787b2e26ae5c83cbd931622c1e93c7e639f05c784e7ee13d43def3d55301643d049172862f4429277272e60ac76d02f75abede985d20476a511e7e0a3e8377172cc7d0d1ef63c8882918327a0a868e7b0f6f8c998ac1232761d08877c5f1b551933178d4540c1cfb3efad2b57dc67e883e6366a2cfb88ff0ead85918f5d92a7c1f1c84147a263fdbd7eb786c9e03cf85e724e5bc87e03d43def3d533017c1244ae6cdc1e708fc539873d80974c9cc4db41ca8a90955f48b9ab00973363b021e8106650be0c983e17bd874fc22b6f4cc4c0d1d34541e837ea03f4799b0ac3071f63dadaaff0f5b9a3b898194bf7e68b67f0b324703c068fc563f2d83c079e0bcfe949f0fe1480ac4720b6e5444ec65cd1b82de0de8a1b540e1b5e2af17a9317ed12c8020e6d4aeeed30c97b18462629234fe657fc1e5fc3d74ad0f819fc2c091c8fc163f1983c36cf81e7c273e2b9f11c79ae1dc3f659e0b19e0920ab2344a93a733bc03d1537a69237f23a938de15062e3d83b38bc383fb1e19cabd87b0450ca5d0cc6afe83dbe86afe57bf85e7e063f8b9fc9cfe631782c1e53f23a9e0bcf49b42a3e05e379e1b19e1920cb2f449f9016de48eb4b5ea4fb82e48d4b4eeabc85ce86738564ef61189cbb580cc757d279be86afe57bbcd0cce259fc4c5f703c268fcd73904296e7f67bc2633d1740491d41727848dec88b73dee1e010e2eac71b961c56bc75ce06738e62afe116833d8893bea6c4447058c63699c4397e8fafe16bf91ebe979fc1cfe267f2b3790c1e8bc7e4b125affbbd42b6a37e1780ac8e10f99316058626cfdb436c0c7b03eff67258f1f70eec29dc56b0d7484005d4528780f390e89cf43e5fcbf7f0bdfc0c7e9608557ab6f0381a8bc714b9ee0ff03a5ffd6e0059be10fd81141ec9a15def11d5900d16ff01d006947f0dc040f87729dc72f88acff17b7c8d048cefe567f0b3f899fc6c1ec31fb83f021eeb770528a933901c4e9c8f2498fcddab004a212741e5dcc561f890e89c048bafe57bf8de76689ce3fe447092fe108092fc827c08a6d73325a01c76dc6630147fe2f7f81a0918dfcbcf90a0f1b3ff2c705efd03ff0f22576ef18e0193710000000049454e44ae426082, '628212951682');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indexes for table `tb_detailpinjam`
--
ALTER TABLE `tb_detailpinjam`
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `tb_pinjam`
--
ALTER TABLE `tb_pinjam`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_pustakawan` (`id_pustakawan`),
  ADD KEY `NIS` (`NIS`);

--
-- Indexes for table `tb_pustakawan`
--
ALTER TABLE `tb_pustakawan`
  ADD PRIMARY KEY (`id_pustakawan`,`username`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`NIS`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `tb_penerbit` (`id_penerbit`);

--
-- Constraints for table `tb_detailpinjam`
--
ALTER TABLE `tb_detailpinjam`
  ADD CONSTRAINT `tb_detailpinjam_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`),
  ADD CONSTRAINT `tb_detailpinjam_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `tb_pinjam` (`id_peminjaman`);

--
-- Constraints for table `tb_pinjam`
--
ALTER TABLE `tb_pinjam`
  ADD CONSTRAINT `tb_pinjam_ibfk_1` FOREIGN KEY (`id_pustakawan`) REFERENCES `tb_pustakawan` (`id_pustakawan`),
  ADD CONSTRAINT `tb_pinjam_ibfk_2` FOREIGN KEY (`NIS`) REFERENCES `tb_siswa` (`NIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;