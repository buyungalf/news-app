USE [master]
GO
/****** Object:  Database [StudentProject]    Script Date: 07/10/2022 16:10:42 ******/
CREATE DATABASE [StudentProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentProject] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentProject] SET  MULTI_USER 
GO
ALTER DATABASE [StudentProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentProject', N'ON'
GO
ALTER DATABASE [StudentProject] SET QUERY_STORE = OFF
GO
USE [StudentProject]
GO
/****** Object:  User [buyung123]    Script Date: 07/10/2022 16:10:42 ******/
CREATE USER [buyung123] FOR LOGIN [buyung123] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [buyung123]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 07/10/2022 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_id] [int] NULL,
	[name] [nvarchar](255) NULL,
	[comment] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 07/10/2022 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[author] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[destroyTime] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 07/10/2022 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (1, 1002, N'Buyung', N'ini komentar', CAST(N'2022-10-05T05:39:44.5480000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T05:39:44.5480000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (2, 4, N'User', N'komentar', CAST(N'2022-10-05T05:41:50.0760000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T05:41:50.0760000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (3, 4, N'Admin', N'komentar 2', CAST(N'2022-10-05T05:50:00.3910000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T05:50:00.3910000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (4, 4, N'Lisa', N'komentar 3', CAST(N'2022-10-05T05:51:44.7400000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T05:51:44.7400000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (5, 5, N'Admin', N'komentar 1', CAST(N'2022-10-05T05:52:09.2810000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T05:52:09.2810000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (6, 4, N'User 2', N'komentar 4', CAST(N'2022-10-05T06:02:19.9370000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T06:02:19.9370000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (7, 1005, N'Lisa', N'Komentarr', CAST(N'2022-10-05T06:02:37.2570000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T06:02:37.2570000+00:00' AS DateTimeOffset))
INSERT [dbo].[comments] ([id], [news_id], [name], [comment], [createdAt], [updatedAt]) VALUES (8, 4, N'User 5', N'komentar', CAST(N'2022-10-05T06:05:02.7860000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T06:05:02.7860000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (4, N'5 Fakta Kasus Baim Wong, Bikin Konten Prank KDRT, Dilaporkan ke Polisi, Terancam Kurungan Penjara', N'Bermula saat Youtube Baim Paula menayangkan sebuah video pada Minggu (2/10/2022) yang berisi Paula Verhoeven berpura-pura membuat laporan kasus kekerasan dalam rumah tangga (KDRT).

Paula masuk ke kantor Polsek Kebayoran Lama menggunakan kamera tersembunyi, sementara Baim duduk di dalam mobil memantau aktivitas istrinya melalui layar monitor.

Di dalam kantor Polsek Kebayoran Lama, Paula mengatakan ia ingin melaporkan suaminya yang telah berbuat KDRT.

"Ini suami saya KDRT, Pak. Makanya saya mau bikin laporannya. Gimana ya, Pak?" kata Paula.

Polisi yang bertugas yang semula tak tahu identitasnya kemudian meminta ibu dua anak itu melepas maskernya dan mulai mengenali Paula.

Tak lama, Baim masuk ke Kantor Polsek Kebayoran Lama menemui Paula di dalam ruangan pelaporan yang membuat sang polisi menyadari bahwa ia sedang di-prank.

Baim dan Paula pun tertawa-tawa sembari mengiyakan bahwa mereka sedang melakukan prank. 

Setelah video itu mendapat respons negatif dari netizen, Baim menghapus konten tersebut dari YouTube.', N'public\images\1664780063991-baim-wong-paula.png', N'buyung', CAST(N'2022-10-03T06:54:23.9930000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T14:16:11.4670000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (5, N'Respons Deklarasi Anies, Pengamat Sarankan PDIP Pilih Capres Populer: Ganjar Opsi yang Tepat', N'Saidiman mengatakan, saat ini ada tiga tokoh yang populer dan potensial sebagai capres pada Pilpres 2024 mendatang. Dari  tiga tokoh itu, dua di antaranya sudah dideklarasikan sebagai capres.

"Saat ini sudah ada tiga tokoh populer yang mencuat ke publik untuk menjadi kandidat Presiden 2024 mendatang dan sudah ada dua yang dideklarasikan sebagai Capres oleh partai," kata Saidiman dalam keterangan resminya di Jakarta yang dikutip pada Rabu (5/10/2022).

Dia membeberkan ketiga tokoh itu populer itu yakni Prabowo Subianto yang dicalonkan oleh Partai Gerindra dan Anies Baswedan dicalonkan oleh Partai Nasdem.

Sementara Ganjar Pranowo sebagai tokoh populer belum dicalonkan oleh partai manapun. Salah satunya Partai Solidaritas Indonesia (PSI).

Menurut Saidiman, PDIP harus mengambil sikap dalam merespons deklarasi capres tersebut. Dia berpendapat, PDIP perlu mengusung calon yang juga populer di masyarakat.

Adapun saat ini, kata Saidiman, tokoh yang populer untuk diusung sebagai capres adalah Gubernur Jawa Tengah Ganjar Pranowo.', N'public\images\1664780079242-cba.jpeg', N'buyung', CAST(N'2022-10-03T06:54:39.2420000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T03:47:20.0210000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (1002, N'Liverpool Menang Lawan Napoli', N'Hasil tak menggembirakan yang diraih Liverpool belakangan membuat Jurgen Klopp dihujani kritik. Pria asal Jerman itu dianggap tak memiliki alternatif ketika taktiknya buntu.

Klopp pun merespons situasi ini dengan memasang formasi baru melawan Rangers. Jika biasanya ia menerapkan formasi 4-3-3, maka kini Liverpool bermain dengan 4-2-3-1.

Darwin Nunez yang baru direkrut musim panas kemarin dimainkan sebagai ujung tombak. Di belakangnya, berdiri trio Mohamed Salah, Diogo Jota, dan Luis Diaz.', N'public\images\1664933589231-liverpool-rangers_4bd854e.jpg', N'buyung', CAST(N'2022-10-05T01:33:09.2540000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T01:33:09.2540000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (1005, N'KPK Ultimatum Istri dan Anak Gubernur Papua Lukas Enembe', N'Ali memastikan surat pemanggilan telah disampaikan secara patut kepada istri dan anak Lukas Enembe.

Diketahui pihak Lukas pun menyebut sudah menerima surat panggilan pemeriksaan tersebut. Namun kuasa hukum Lukas Enembe meminta agar KPK memeriksa keduanya di kediaman Lukas Enembe.

Ali meminta kepada kuasa hukum Lukas Enembe agar tak mencoba merintangi proses hukum. Lagipula, menurut Ali, tak ada kewajiban seorang saksi harus didampingi kuasa hukum saat diperiksa.

"Tidak ada dasar hukum saksi wajib didampingi penasihat hukum," kata Ali.

Diketahui, KPK mengagendakan pemeriksaan terhadap anak dan istri Gubernur Papua Lukas Enembe. Mereka adalah, Astract Bona Timoramo anak Lukas Enembe, dan Yulce Wenda istri Lukas Enembe.

Keduanya akan dimintai keteranhan seputar kasus dugaan suap dan gratifikasi proyek infrastruktur di Pemprov Papua yang menjerat Lukas Enembe.

"Pemeriksaan dilakukan di Kantor KPK RI, Jl. Kuningan persada Kav. 4, Setiabudi," ujar Kabag Pemberitaan KPK Ali Fikri dalam keterangannya, Rabu (5/10/2022).

Selain Astract dan Yulce, KPK juga mengagendakan memanggil saksi lainnya yakni Willicius pihak swasta, Yonater Karomba pihak swasta, dan Feans Manibui swasta dari PT Cenderawasih Mas.

Sebelumnya, KPK menduga Gubernur Papua Lukas Enembe kerap menyewa pesawat jet pribadi dan layanan kelas satu dalam penerbangan saat bertolak ke luar negeri.

Dugaan itu diketahui saat tim penyidik lembaga antirasuah memeriksa Pramugari PT RDG Airlines Tamara Anggraeny pada Senin, 3 Oktober 2022 kemarin. Tamara diperiksa di Gedung KPK.

"Saksi hadir dan didalami pengetahuannya antara lain terkait dugaan adanya penggunaan private jet dengan layanan first class oleh LE (Lukas)," ujar Kabag Pemberitaan KPK Ali Fikri dalam keterangannya, Selasa (4/10/2022).

Selain soal jet pribadi, Tamara juga dicecar soal aliran uang yang diberikan Lukas Enembe kepada beberapa pihak. Namun Ali tak membongkar siapa pihak dimaksud.

"Kemudian dikonfirmasi juga mengenai pengetahuan saksi soal dugaan uang yang diberikan tersangka ke beberapa pihak," kata Ali.

Tamara Anggraeny sendiri usai diperiksa tim penyidik mengaku pemeriksaannya kali ini berkaitan dengan penyewaan pesawat jet pribadi oleh Gubernur Papua Lukas Enembe.

"Soal penerbangan saja. Iya (pesawat jet pribadi)," ujar Tamara di Gedung KPK, Kungingan, Jakarta Selatan, Senin (3/10/2022).

Tamara mengungkap pemilik pesawat jet pribadi yang kerap disewa Lukas Enembe untuk bertolak ke luar negeri. Menurut Tamara, pesawat jet pribadi itu milik orang Singapura.

"Punya pribadi orang Singapura," kata dia.

Tamara mengungkap Lukas Enembe tidak hanya sekali menyewa pesawat jet pribadi itu. Hanya saja, Tamara tidak mengungkap secara pasti. Tamara juga tak menjawab tegas ketika ditanya tujuan penerbangan Lukas.

"Banyak banget, beberapa kali," kata dia.', N'public\images\1664949376525-633d02933bab0.jpeg', N'buyung', CAST(N'2022-10-05T05:56:16.5510000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T05:56:16.5510000+00:00' AS DateTimeOffset), NULL)
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (1007, N'asdasdasd', N'asdasdasd', N'public\images\1664979009628-liverpool-rangers_4bd854e.jpg', N'asdasdasd', CAST(N'2022-10-05T14:10:09.6310000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T14:10:09.6310000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T14:11:52.7680000+00:00' AS DateTimeOffset))
INSERT [dbo].[news] ([id], [title], [content], [thumbnail], [author], [createdAt], [updatedAt], [destroyTime]) VALUES (1008, N'22', N'33', N'public\images\1664979166331-cba.jpeg', N'33', CAST(N'2022-10-05T14:12:46.3340000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T14:13:20.4130000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T14:22:14.9090000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [nama], [email], [username], [password], [createdAt], [updatedAt]) VALUES (1, N'Administrator', N'admin@gmail.com', N'admin', N'$2a$08$1mZ6hX2lYg32Yl6ErxSUqeuYOoAUCGsg3ZltZ.gfgSGE6H15tT9bW', CAST(N'2022-10-04T02:46:41.2920000+00:00' AS DateTimeOffset), CAST(N'2022-10-04T02:46:41.2920000+00:00' AS DateTimeOffset))
INSERT [dbo].[users] ([id], [nama], [email], [username], [password], [createdAt], [updatedAt]) VALUES (2, N'Buyung', N'buyungalf@gmail.com', N'buyung', N'$2a$08$Y.BS9U5bgEn.hMf4fupM3.s9kZSIOOve8s1nmSyUCZ7TbajbbC/D6', CAST(N'2022-10-05T14:26:10.0140000+00:00' AS DateTimeOffset), CAST(N'2022-10-05T14:26:10.0140000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
USE [master]
GO
ALTER DATABASE [StudentProject] SET  READ_WRITE 
GO
