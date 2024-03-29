USE [master]
GO
/****** Object:  Database [VAvilesProgramacionNCapas]    Script Date: 6/17/2022 12:12:22 PM ******/
CREATE DATABASE [VAvilesProgramacionNCapas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VAvilesProgramacionNCapas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\VAvilesProgramacionNCapas.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VAvilesProgramacionNCapas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\VAvilesProgramacionNCapas_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VAvilesProgramacionNCapas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET ARITHABORT OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET RECOVERY FULL 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET  MULTI_USER 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VAvilesProgramacionNCapas', N'ON'
GO
USE [VAvilesProgramacionNCapas]
GO
/****** Object:  StoredProcedure [dbo].[AseguradoraAdd]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AseguradoraAdd]
@Nombre VARCHAR(50),
@IdUsuario int
as 
INSERT INTO Aseguradoras(Nombre, FechaCreacion , FechaModificacion, IdUsuario)
VALUES (@Nombre, GETDATE(), GETDATE(), @IdUsuario)
GO
/****** Object:  StoredProcedure [dbo].[AseguradoraDelete]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AseguradoraDelete]
@IdAsegurradora int 
as
DELETE FROM Aseguradoras
WHERE IdAsegurradora = @IdAsegurradora
GO
/****** Object:  StoredProcedure [dbo].[AseguradoraGetAll]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AseguradoraGetAll]

	AS
		SELECT
			Aseguradoras.IdAsegurradora, 
			Aseguradoras.Nombre,
			Aseguradoras.FechaCreacion,
			Aseguradoras.FechaModificacion,
			Aseguradoras.IdUsuario,
			Usuario.Nombre as UsuarioNombre
			
		FROM 
			Aseguradoras
			inner join	Usuario  on Aseguradoras.IdUsuario = Usuario.IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[AseguradoraGetById]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROCEDURE [dbo].[AseguradoraGetById]
@IdAsegurradora INT
AS
	SELECT
		Aseguradoras.IdAsegurradora, 
		Aseguradoras.Nombre,
		Aseguradoras.FechaCreacion,
		Aseguradoras.FechaModificacion,
		Aseguradoras.IdUsuario,
		Usuario.Nombre AS UsuarioNombre
		

	FROM 
		Aseguradoras
		INNER JOIN Usuario on Usuario.IdUsuario = Aseguradoras.IdUsuario
	WHERE 
		IdAsegurradora = @IdAsegurradora;
GO
/****** Object:  StoredProcedure [dbo].[AseguradorasAdd]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AseguradorasAdd]
@Nombre VARCHAR,
@FechaCreacion DATETIME,
@FechaModificacion DATETIME,
@IdUsuario int
as 
INSERT INTO Aseguradoras(Nombre, FechaCreacion , FechaModificacion, IdUsuario)
VALUES (@Nombre, GETDATE(), GETDATE(), @IdUsuario)
GO
/****** Object:  StoredProcedure [dbo].[AseguradoraUpdate]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AseguradoraUpdate]
@IdAsegurradora int,
@Nombre VARCHAR(50),
@IdUsuario int
as 
UPDATE Aseguradoras SET Nombre = @Nombre, FechaModificacion = GETDATE() WHERE IdAsegurradora = @IdAsegurradora;
GO
/****** Object:  StoredProcedure [dbo].[Consulta]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Consulta]

as 
select * from Usuario
where IdUsuario = 1

GO
/****** Object:  StoredProcedure [dbo].[EliminarRegistro]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarRegistro]
@IdUsuario int
as
DELETE FROM Usuario
WHERE IdUsuario = @IdUsuario;
GO
/****** Object:  StoredProcedure [dbo].[EstadoGetByIdPais]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EstadoGetByIdPais]
@IdPais INT
AS
SELECT IdEstado,Nombre,IdPais
FROM Estado
WHERE IdPais = @IdPais 
GO
/****** Object:  StoredProcedure [dbo].[PaisGetALL]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaisGetALL]
AS
SELECT IdPais,Nombre
From Pais
GO
/****** Object:  StoredProcedure [dbo].[RolGetAll]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RolGetAll]
		as 
		select 
		IdRol, 
		Nombre
		FROM 
		Rol
GO
/****** Object:  StoredProcedure [dbo].[UserGetAll]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserGetAll]
as
select IdUsuario,
Nombre
FROM
Usuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioAdd]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioAdd]
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@Email VARCHAR(254),
@Sexo CHAR(2),
@Telefono VARCHAR(20),
@Celular VARCHAR(20),
@FechaNacimiento VARCHAR(20),
@CURP VARCHAR(50),
@IdRol int
as
INSERT INTO Usuario (Nombre,ApellidoPaterno,ApellidoMaterno,Email,Sexo,Telefono,Celular, FechaNacimiento,CURP,IdRol)
 VALUES (@Nombre,@ApellidoPaterno,@ApellidoMaterno,@Email,@Sexo,@Telefono,@Celular, CONVERT(DATE,@FechaNacimiento,105),@CURP,@IdRol)
GO
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioDelete]
@IdUsuario int
as
DELETE FROM Usuario 
WHERE IdUsuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetAll]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetAll]

AS
	SELECT
		Usuario.IdUsuario, 
		Usuario.Nombre,
		Usuario.ApellidoPaterno,
		Usuario.ApellidoMaterno,
		Usuario.Email,
		Usuario.Sexo,
		Usuario.Telefono, 
		Usuario.Celular,
		Usuario.FechaNacimiento,
		Usuario.CURP,
		Usuario.Imagen,
		Usuario.IdRol,
		Rol.Nombre as RolNombre

	FROM 
		Usuario 
		inner join	Rol  on Usuario.IdRol = Rol.IdRol
GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetById]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetById]
@IdUsuario INT
AS
	SELECT
		Usuario.IdUsuario, 
		Usuario.Nombre,
		Usuario.ApellidoPaterno,
		Usuario.ApellidoMaterno,
		Usuario.Email,
		Usuario.Sexo,
		Usuario.Telefono, 
		Usuario.Celular,
		Usuario.FechaNacimiento,
		Usuario.CURP,
		Usuario.Imagen,
		Usuario.IdRol,
		Rol.Nombre AS RolNombre

	FROM 
		Usuario
		INNER JOIN Rol on Usuario.IdRol = Rol.IdRol
  WHERE IdUsuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdate]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioUpdate]
@IdUsuario int, 
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@Email VARCHAR(254),
@Sexo CHAR(2),
@Telefono VARCHAR(20),
@Celular VARCHAR(20),
@FechaNacimiento VARCHAR(20),
@CURP VARCHAR(50),
@IdRol int
as
UPDATE Usuario SET Nombre = @Nombre,ApellidoPaterno = @ApellidoPaterno, ApellidoMaterno = @ApellidoMaterno,
Email= @Email, Sexo = @Sexo, Telefono = @Telefono, Celular = @Celular, FechaNacimiento = CONVERT(DATE,@FechaNacimiento),
CURP = @CURP, IdRol = @IdRol WHERE IdUsuario = @IdUsuario
GO
/****** Object:  Table [dbo].[Aseguradoras]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aseguradoras](
	[IdAsegurradora] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAsegurradora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Colonia]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colonia](
	[IdColonia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CodigoPostal] [varchar](50) NOT NULL,
	[IdMunicipio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdColonia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[NumeroInterior] [varchar](50) NOT NULL,
	[NumeroExterior] [varchar](50) NOT NULL,
	[IdColonia] [int] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipio](
	[IdMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdEstado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/17/2022 12:12:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Email] [varchar](254) NOT NULL,
	[Sexo] [char](2) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Celular] [varchar](20) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[CURP] [varchar](50) NULL,
	[Imagen] [varbinary](max) NULL,
	[IdRol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Aseguradoras] ON 

INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (16, N'AXXA81', CAST(0x0000AEAD00BEEEF1 AS DateTime), CAST(0x0000AEB5010736B8 AS DateTime), 21)
INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (18, N'BBVA', CAST(0x0000AEAF00B49F68 AS DateTime), CAST(0x0000AEAF00B49F68 AS DateTime), 8)
INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (21, N'AXXA454', CAST(0x0000AEAF00CBE166 AS DateTime), CAST(0x0000AEAF00CBE166 AS DateTime), 8)
INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (22, N'AXXA4', CAST(0x0000AEAF00CCAE72 AS DateTime), CAST(0x0000AEAF00CCAE72 AS DateTime), 8)
INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (23, N'AXXXA4', CAST(0x0000AEAF00CCCF01 AS DateTime), CAST(0x0000AEAF00CCCF01 AS DateTime), 8)
INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (24, N'AXXA5', CAST(0x0000AEAF00CD0499 AS DateTime), CAST(0x0000AEB501071F95 AS DateTime), 8)
INSERT [dbo].[Aseguradoras] ([IdAsegurradora], [Nombre], [FechaCreacion], [FechaModificacion], [IdUsuario]) VALUES (29, N'AXXA5', CAST(0x0000AEB500F585FD AS DateTime), CAST(0x0000AEB500F585FD AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[Aseguradoras] OFF
SET IDENTITY_INSERT [dbo].[Colonia] ON 

INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [CodigoPostal], [IdMunicipio]) VALUES (1, N'Agricola', N'56054', 1)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [CodigoPostal], [IdMunicipio]) VALUES (2, N'Haar', N'56000', 2)
SET IDENTITY_INSERT [dbo].[Colonia] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [NumeroInterior], [NumeroExterior], [IdColonia], [IdUsuario]) VALUES (2, N'Emiliano Zapta', N'5', N'9', 1, 17)
SET IDENTITY_INSERT [dbo].[Direccion] OFF
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([IdEstado], [Nombre], [IdPais]) VALUES (1, N'VERACRUZ', 1)
INSERT [dbo].[Estado] ([IdEstado], [Nombre], [IdPais]) VALUES (2, N'Munich', 2)
SET IDENTITY_INSERT [dbo].[Estado] OFF
SET IDENTITY_INSERT [dbo].[Municipio] ON 

INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (1, N'XALAPA', 1)
INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (2, N'Marckt', 2)
SET IDENTITY_INSERT [dbo].[Municipio] OFF
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (1, N'Mexico')
INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (2, N'Alemania')
SET IDENTITY_INSERT [dbo].[Pais] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (2, N'USEER')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Sexo], [Telefono], [Celular], [FechaNacimiento], [CURP], [Imagen], [IdRol]) VALUES (8, N'uriel', N'avilesP', N'AlvarezP', N'preuba2', N'M ', N'59775677', N'12457896', CAST(0xA8430B00 AS Date), N'AIAV9701299HDFVLC', NULL, 2)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Sexo], [Telefono], [Celular], [FechaNacimiento], [CURP], [Imagen], [IdRol]) VALUES (10, N'Victor4', N'Aviles4', N'Alvarez', N'Prueba22', N'M ', N'59775677', N'5549451235', CAST(0x90400B00 AS Date), N'AIABC970129HDFVLC088', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Sexo], [Telefono], [Celular], [FechaNacimiento], [CURP], [Imagen], [IdRol]) VALUES (15, N'Victor3', N'Aviles', N'Alvarez', N'Prueba222', N'M ', N'59775677', N'5549451235', CAST(0x90400B00 AS Date), N'AIABC970129HDFVLC088', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Sexo], [Telefono], [Celular], [FechaNacimiento], [CURP], [Imagen], [IdRol]) VALUES (17, N'uriel4', N'aviles4', N'alvarex4', N'prejabsd4', N'M ', N'59975677', N'59481622', CAST(0x90400B00 AS Date), N'AIAV970129HFGLVC', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Sexo], [Telefono], [Celular], [FechaNacimiento], [CURP], [Imagen], [IdRol]) VALUES (20, N'Uriel 4', N'aviles', N'Alvarez', N'Preuba@gmail.com', N'M ', N'59775677', N'59775641', CAST(0x90400B00 AS Date), N'AIAV970219HFVLC', NULL, 1)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Email], [Sexo], [Telefono], [Celular], [FechaNacimiento], [CURP], [Imagen], [IdRol]) VALUES (21, N'victor6', N'aviles6', N'alvarez6', N'preba6', N'M ', N'597756774', N'59775844', CAST(0xB0400B00 AS Date), N'AIAV970129HDFVLC', NULL, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Usuario__75E3EFCF526420C3]    Script Date: 6/17/2022 12:12:22 PM ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Usuario__A9D10534EE08B604]    Script Date: 6/17/2022 12:12:22 PM ******/
ALTER TABLE [dbo].[Usuario] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aseguradoras]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Colonia]  WITH CHECK ADD FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[Municipio] ([IdMunicipio])
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD FOREIGN KEY([IdColonia])
REFERENCES [dbo].[Colonia] ([IdColonia])
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
USE [master]
GO
ALTER DATABASE [VAvilesProgramacionNCapas] SET  READ_WRITE 
GO
