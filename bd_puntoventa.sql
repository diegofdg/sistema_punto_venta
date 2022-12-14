USE [master]
GO
/****** Object:  Database [BD_PUNTOVENTA]    Script Date: 24/08/2022 20:50:33 ******/
CREATE DATABASE [BD_PUNTOVENTA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_PUNTOVENTA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_PUNTOVENTA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_PUNTOVENTA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_PUNTOVENTA_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_PUNTOVENTA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_PUNTOVENTA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET  MULTI_USER 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_PUNTOVENTA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_PUNTOVENTA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_PUNTOVENTA', N'ON'
GO
ALTER DATABASE [BD_PUNTOVENTA] SET QUERY_STORE = OFF
GO
USE [BD_PUNTOVENTA]
GO
/****** Object:  UserDefinedTableType [dbo].[Ty_Pr_Pv_OK]    Script Date: 24/08/2022 20:50:34 ******/
CREATE TYPE [dbo].[Ty_Pr_Pv_OK] AS TABLE(
	[descripcion_pv] [varchar](30) NULL,
	[ok] [bit] NULL,
	[codigo_pv] [int] NULL
)
GO
/****** Object:  Table [dbo].[TB_AREA_DESPACHO]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_AREA_DESPACHO](
	[codigo_ad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_ad] [varchar](30) NULL,
	[impresora] [varchar](50) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_AREADESPACHO] PRIMARY KEY CLUSTERED 
(
	[codigo_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CARGOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CARGOS](
	[codigo_ca] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_ca] [varchar](80) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_CARGOS] PRIMARY KEY CLUSTERED 
(
	[codigo_ca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CIERRES_TURNOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CIERRES_TURNOS](
	[fecha_ct] [date] NULL,
	[codigo_pv] [int] NULL,
	[codigo_tu] [int] NULL,
	[estado_tu] [bit] NULL,
	[fecha_crea] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CLIENTES]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CLIENTES](
	[codigo_cl] [int] IDENTITY(1,1) NOT NULL,
	[codigo_tdc] [int] NULL,
	[nrodocumento_cl] [varchar](30) NULL,
	[cliente] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[movil] [varchar](20) NULL,
	[correo] [varchar](150) NULL,
	[fecha_crea] [datetime] NULL,
	[fecha_modifica] [datetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[codigo_cl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_DETALLE_TICKETS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DETALLE_TICKETS](
	[codigo_ti] [int] IDENTITY(1,1) NOT NULL,
	[codigo_pr] [int] NULL,
	[cantidad] [decimal](10, 2) NULL,
	[precio_unitario] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
	[observacion] [varchar](50) NULL,
	[impresora] [varchar](50) NULL,
 CONSTRAINT [PK_TB_DETALLE_TICKETS] PRIMARY KEY CLUSTERED 
(
	[codigo_ti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ENCABEZADO_TICKETS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ENCABEZADO_TICKETS](
	[codigo_ti] [int] IDENTITY(1,1) NOT NULL,
	[fecha_emision] [datetime] NULL,
	[codigo_cl] [int] NULL,
	[nrodocumento_cl] [varchar](30) NULL,
	[cliente] [varbinary](150) NULL,
	[codigo_me] [int] NULL,
	[total_ti] [decimal](10, 2) NULL,
	[codigo_tu] [int] NULL,
	[anulado_ti] [bit] NULL,
	[observacion_anulado] [text] NULL,
	[codigo_us] [int] NULL,
	[codigo_tdco] [int] NULL,
	[serie_tdco] [varchar](5) NULL,
	[correlativo_co] [varchar](20) NULL,
 CONSTRAINT [PK_TB_ENCABEZADO_TICKETS] PRIMARY KEY CLUSTERED 
(
	[codigo_ti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FAMILIAS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FAMILIAS](
	[codigo_fa] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_fa] [varchar](30) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_FAMILIAS] PRIMARY KEY CLUSTERED 
(
	[codigo_fa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_IMAGEN_PRODUCTOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_IMAGEN_PRODUCTOS](
	[codigo_pr] [int] NULL,
	[imagen] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_IMAGENES_PREDETERMINADAS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_IMAGENES_PREDETERMINADAS](
	[producto] [image] NULL,
	[disponible] [image] NULL,
	[nodisponible] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MARCAS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MARCAS](
	[codigo_ma] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_ma] [varchar](50) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_MARCAS] PRIMARY KEY CLUSTERED 
(
	[codigo_ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MESAS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MESAS](
	[codigo_me] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_me] [varchar](20) NULL,
	[codigo_pv] [int] NULL,
	[estado] [bit] NULL,
	[disponible] [bit] NULL,
 CONSTRAINT [PK_TB_MESAS] PRIMARY KEY CLUSTERED 
(
	[codigo_me] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PRODUCTOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PRODUCTOS](
	[codigo_pr] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_pr] [varchar](100) NULL,
	[codigo_ma] [int] NULL,
	[codigo_um] [int] NULL,
	[codigo_sf] [int] NULL,
	[precio_unitario] [decimal](10, 2) NULL,
	[codigo_ad] [int] NULL,
	[observacion] [text] NULL,
	[fecha_crea] [datetime] NULL,
	[fecha_modifica] [datetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[codigo_pr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PRODUCTOS_DISPONIBLES_PV]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PRODUCTOS_DISPONIBLES_PV](
	[codigo_pr] [int] NULL,
	[codigo_pv] [int] NULL,
	[disponible] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PUNTO_VENTA]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PUNTO_VENTA](
	[codigo_pv] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_pv] [varchar](30) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_PUNTOVENTA] PRIMARY KEY CLUSTERED 
(
	[codigo_pv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ROLES_USUARIOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ROLES_USUARIOS](
	[codigo_ro] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_ro] [varchar](30) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_ROLES_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[codigo_ro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_SUBFAMILIAS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SUBFAMILIAS](
	[codigo_sf] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_sf] [varchar](30) NULL,
	[codigo_fa] [int] NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_SUBFAMILIAS] PRIMARY KEY CLUSTERED 
(
	[codigo_sf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TIPO_DOC_CLIENTES]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TIPO_DOC_CLIENTES](
	[codigo_tdc] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_tdc] [varchar](30) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_TIPO_DOC_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[codigo_tdc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TIPO_DOC_COMPROBANTES]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TIPO_DOC_COMPROBANTES](
	[codigo_tdco] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_tdco] [varchar](20) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_TIPO_DOC_COMPROBANTES] PRIMARY KEY CLUSTERED 
(
	[codigo_tdco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_TURNOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_TURNOS](
	[codigo_tu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_tu] [varchar](20) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_TURNOS] PRIMARY KEY CLUSTERED 
(
	[codigo_tu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_UNIDADES_MEDIDAS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UNIDADES_MEDIDAS](
	[codigo_um] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_um] [varchar](15) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_UNIDADES_MEDIDAS] PRIMARY KEY CLUSTERED 
(
	[codigo_um] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_USUARIOS]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USUARIOS](
	[codigo_us] [int] IDENTITY(1,1) NOT NULL,
	[login_us] [varchar](20) NULL,
	[password_us] [varchar](20) NULL,
	[nombre_us] [varchar](100) NULL,
	[codigo_ca] [int] NULL,
	[codigo_ro] [int] NULL,
	[fecha_crea] [datetime] NULL,
	[fecha_modifica] [datetime] NULL,
	[fecha_ultima_sesion] [datetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TB_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[codigo_us] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_CLIENTES]  WITH CHECK ADD  CONSTRAINT [FK_TB_CLIENTES_TB_TIPO_DOC_CLIENTES] FOREIGN KEY([codigo_tdc])
REFERENCES [dbo].[TB_TIPO_DOC_CLIENTES] ([codigo_tdc])
GO
ALTER TABLE [dbo].[TB_CLIENTES] CHECK CONSTRAINT [FK_TB_CLIENTES_TB_TIPO_DOC_CLIENTES]
GO
ALTER TABLE [dbo].[TB_ENCABEZADO_TICKETS]  WITH CHECK ADD  CONSTRAINT [FK_TB_ENCABEZADO_TICKETS_TB_DETALLE_TICKETS] FOREIGN KEY([codigo_ti])
REFERENCES [dbo].[TB_DETALLE_TICKETS] ([codigo_ti])
GO
ALTER TABLE [dbo].[TB_ENCABEZADO_TICKETS] CHECK CONSTRAINT [FK_TB_ENCABEZADO_TICKETS_TB_DETALLE_TICKETS]
GO
ALTER TABLE [dbo].[TB_IMAGEN_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_IMAGEN_PRODUCTO_TB_PRODUCTOS] FOREIGN KEY([codigo_pr])
REFERENCES [dbo].[TB_PRODUCTOS] ([codigo_pr])
GO
ALTER TABLE [dbo].[TB_IMAGEN_PRODUCTOS] CHECK CONSTRAINT [FK_TB_IMAGEN_PRODUCTO_TB_PRODUCTOS]
GO
ALTER TABLE [dbo].[TB_MESAS]  WITH CHECK ADD  CONSTRAINT [FK_TB_MESAS_TB_PUNTO_VENTA] FOREIGN KEY([codigo_pv])
REFERENCES [dbo].[TB_PUNTO_VENTA] ([codigo_pv])
GO
ALTER TABLE [dbo].[TB_MESAS] CHECK CONSTRAINT [FK_TB_MESAS_TB_PUNTO_VENTA]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_AREA_DESPACHO] FOREIGN KEY([codigo_ad])
REFERENCES [dbo].[TB_AREA_DESPACHO] ([codigo_ad])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_AREA_DESPACHO]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_MARCAS] FOREIGN KEY([codigo_ma])
REFERENCES [dbo].[TB_MARCAS] ([codigo_ma])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_MARCAS]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_SUBFAMILIAS] FOREIGN KEY([codigo_sf])
REFERENCES [dbo].[TB_SUBFAMILIAS] ([codigo_sf])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_SUBFAMILIAS]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_UNIDADES_MEDIDAS] FOREIGN KEY([codigo_um])
REFERENCES [dbo].[TB_UNIDADES_MEDIDAS] ([codigo_um])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_UNIDADES_MEDIDAS]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS_DISPONIBLES_PV]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_DISPONIBLES_PV_TB_PRODUCTOS] FOREIGN KEY([codigo_pr])
REFERENCES [dbo].[TB_PRODUCTOS] ([codigo_pr])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS_DISPONIBLES_PV] CHECK CONSTRAINT [FK_TB_PRODUCTOS_DISPONIBLES_PV_TB_PRODUCTOS]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS_DISPONIBLES_PV]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_DISPONIBLES_PV_TB_PUNTO_VENTA] FOREIGN KEY([codigo_pv])
REFERENCES [dbo].[TB_PUNTO_VENTA] ([codigo_pv])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS_DISPONIBLES_PV] CHECK CONSTRAINT [FK_TB_PRODUCTOS_DISPONIBLES_PV_TB_PUNTO_VENTA]
GO
ALTER TABLE [dbo].[TB_SUBFAMILIAS]  WITH CHECK ADD  CONSTRAINT [FK_TB_SUBFAMILIAS_TB_FAMILIAS1] FOREIGN KEY([codigo_fa])
REFERENCES [dbo].[TB_FAMILIAS] ([codigo_fa])
GO
ALTER TABLE [dbo].[TB_SUBFAMILIAS] CHECK CONSTRAINT [FK_TB_SUBFAMILIAS_TB_FAMILIAS1]
GO
ALTER TABLE [dbo].[TB_USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_USUARIOS_TB_CARGOS] FOREIGN KEY([codigo_ca])
REFERENCES [dbo].[TB_CARGOS] ([codigo_ca])
GO
ALTER TABLE [dbo].[TB_USUARIOS] CHECK CONSTRAINT [FK_TB_USUARIOS_TB_CARGOS]
GO
ALTER TABLE [dbo].[TB_USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_USUARIOS_TB_ROLES_USUARIOS] FOREIGN KEY([codigo_ro])
REFERENCES [dbo].[TB_ROLES_USUARIOS] ([codigo_ro])
GO
ALTER TABLE [dbo].[TB_USUARIOS] CHECK CONSTRAINT [FK_TB_USUARIOS_TB_ROLES_USUARIOS]
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_img_prod_pred]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mostrar_img_prod_pred]
@cProducto int=0
as
select producto from TB_IMAGENES_PREDETERMINADAS;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_ad]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_ad]
@nCodigo int=0
as
update TB_AREA_DESPACHO set estado = 0 where codigo_ad = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_fa]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_fa]
@nCodigo int=0
as
update TB_FAMILIAS set estado = 0 where codigo_fa = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_ma]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_ma]
@nCodigo int=0
as
update TB_MARCAS set estado = 0 where codigo_ma = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_me]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_me]
@nCodigo int=0
as
update TB_MESAS set estado = 0 where codigo_me = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_pr]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_pr]
@nCodigo int=0
as
update TB_PRODUCTOS set estado = 0 where codigo_pr = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_pv]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_Eliminar_pv]
@nCodigo int=0
as
update TB_PUNTO_VENTA set estado = 0 where codigo_pv = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_sf]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_sf]
@nCodigo int=0
as
update TB_SUBFAMILIAS set estado = 0 where codigo_sf = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Eliminar_um]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Eliminar_um]
@nCodigo int=0
as
update TB_UNIDADES_MEDIDAS set estado = 0 where codigo_um = @nCodigo;
GO
/****** Object:  StoredProcedure [dbo].[USP_Estado_turno_pv]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Estado_turno_pv]
@nCodigo_pv int=0
as
select top 1 a.fecha_ct,
	         a.codigo_tu,
	         b.descripcion_tu,
	         a.estado_tu,
	         iif (a.estado_tu = 1, 'Abierto', 'Cerrado') as estado_pv,
	         a.codigo_pv
from TB_CIERRES_TURNOS a
inner join TB_TURNOS b on a.codigo_tu = b.codigo_tu
where a.codigo_pv = @nCodigo_pv
group by a.fecha_ct,
		 a.codigo_tu,
		 b.descripcion_tu,
		 a.codigo_pv,
		 a.estado_tu
order by a.fecha_ct desc,
		 a.codigo_tu desc,
		 a.estado_tu desc
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_ad]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Guardar_ad]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(30)='',
@cImpresora varchar(50)=''
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_AREA_DESPACHO(descripcion_ad,impresora,estado) values(@cDescripcion,@cImpresora,1)
end;
else --Actualizar registro
begin
update TB_AREA_DESPACHO set descripcion_ad = @cDescripcion,
							impresora = @cImpresora
					  where codigo_ad = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_fa]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Guardar_fa]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(30)=''
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_FAMILIAS(descripcion_fa,estado) values(@cDescripcion,1)
end;
else --Actualizar registro
begin
update TB_FAMILIAS set descripcion_fa = @cDescripcion where codigo_fa = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_ma]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Guardar_ma]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(30)=''
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_MARCAS(descripcion_ma,estado) values(@cDescripcion,1)
end;
else --Actualizar registro
begin
update TB_MARCAS set descripcion_ma = @cDescripcion where codigo_ma = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_me]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Guardar_me]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(20)='',
@nCodigo_pv int=0
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_MESAS(descripcion_me,codigo_pv,estado,disponible) values(@cDescripcion,@nCodigo_pv, 1, 1)
end;
else --Actualizar registro
begin
update TB_MESAS set descripcion_me = @cDescripcion,
					codigo_pv = @nCodigo_pv
				where codigo_me = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_pr]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Guardar_pr]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion_pr varchar(100)='',
@nCodigo_ma int=0,
@nCodigo_um int=0,
@nCodigo_sf int=0,
@nPrecio_unitario decimal(10,2)=0,
@nCodigo_ad int=0,
@cObservacion text='',
@oImagen image,
@Ty_01 Ty_Pr_Pv_OK readonly
as
declare @fFecha date
set @fFecha = convert(date, getdate())
if @nOpcion = 1 --Nuevo registro
begin
	insert into TB_PRODUCTOS(descripcion_pr,
							 codigo_ma,
							 codigo_um,
							 codigo_sf,
							 precio_unitario,
							 codigo_ad,
							 observacion,
							 fecha_crea,
							 estado)
					  values(@cDescripcion_pr,
							 @nCodigo_ma,
							 @nCodigo_um,
							 @nCodigo_sf,
							 @nPrecio_unitario,
							 @nCodigo_ad,
							 @cObservacion,
							 @fFecha,
							 1);
	set @nCodigo = @@IDENTITY -- Obtiene el código que se genera automáticamente
	insert into TB_IMAGEN_PRODUCTOS(codigo_pr,imagen) values(@nCodigo,@oImagen);
end;
else --Actualizar registro
begin
	update TB_PRODUCTOS set descripcion_pr = @cDescripcion_pr,
							codigo_ma = @nCodigo_ma,
							codigo_um = @nCodigo_um,
							codigo_sf = @nCodigo_sf,
							precio_unitario = @nPrecio_unitario,
							codigo_ad = @nCodigo_ad,
							observacion = @cObservacion,
							fecha_modifica = @fFecha
						where codigo_pr = @nCodigo;
	update TB_IMAGEN_PRODUCTOS set imagen = @oImagen where codigo_pr = @nCodigo;
end;

delete from TB_PRODUCTOS_DISPONIBLES_PV where codigo_pr = @nCodigo
insert into TB_PRODUCTOS_DISPONIBLES_PV select @nCodigo, 
											    x.codigo_pv,
											    x.ok
										 from @Ty_01 x
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_pv]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_Guardar_pv]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(30)=''
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_PUNTO_VENTA(descripcion_pv,estado) values(@cDescripcion,1)
end;
else --Actualizar registro
begin
update TB_PUNTO_VENTA set descripcion_pv = @cDescripcion where codigo_pv = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_sf]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Guardar_sf]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(30)='',
@nCodigo_fa int=0
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_SUBFAMILIAS(descripcion_sf,codigo_fa,estado) values(@cDescripcion,@nCodigo_fa,1)
end;
else --Actualizar registro
begin
update TB_SUBFAMILIAS set descripcion_sf = @cDescripcion, codigo_fa = @nCodigo_fa where codigo_sf = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_Guardar_um]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Guardar_um]
@nOpcion int=0,
@nCodigo int=0,
@cDescripcion varchar(15)=''
as
if @nOpcion = 1 --Nuevo registro
begin
insert into TB_UNIDADES_MEDIDAS(descripcion_um,estado) values(@cDescripcion,1)
end;
else --Actualizar registro
begin
update TB_UNIDADES_MEDIDAS set descripcion_um = @cDescripcion where codigo_um = @nCodigo;
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_imagen_estado_me]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_imagen_estado_me]
@nEstado int=0
as
select iif(@nEstado = 1, disponible, nodisponible) as estado_me
from TB_IMAGENES_PREDETERMINADAS
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_ad]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Listado_ad]
@cTexto varchar(30)=''
as
select codigo_ad,
	   descripcion_ad,
	   impresora
from TB_AREA_DESPACHO
where estado = 1 and 
upper(trim(cast (codigo_ad as char)))+
trim(descripcion_ad) +
trim(impresora) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_fa]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Listado_fa]
@cTexto varchar(30)=''
as
select codigo_fa, descripcion_fa
from TB_FAMILIAS
where estado = 1 and 
upper(trim(cast (codigo_fa as char)))+
trim(descripcion_fa) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_ma]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Listado_ma]
@cTexto varchar(50)=''
as
select codigo_ma, descripcion_ma
from TB_MARCAS
where estado = 1 and 
upper(trim(cast (codigo_ma as char)))+
trim(descripcion_ma) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_me]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Listado_me]
@cTexto varchar(20)=''
as
select a.codigo_me,
	   a.descripcion_me,
	   b.descripcion_pv,
	   a.codigo_pv
from TB_MESAS a
inner join TB_PUNTO_VENTA b on a.codigo_me = b.codigo_pv
where a.estado = 1 and 
upper(trim(cast (a.codigo_me as char)))+
trim(descripcion_me) +
trim(descripcion_pv) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_pr]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_Listado_pr]
@cTexto varchar(100)=''
as
select a.codigo_pr,
	   a.descripcion_pr,
	   b.descripcion_ma,
	   c.descripcion_um,
	   d.descripcion_sf,
	   a.precio_unitario,
	   e.descripcion_ad,
	   a.observacion,
	   a.codigo_ma,
	   a.codigo_um,
	   a.codigo_sf,
	   a.codigo_ad
from TB_PRODUCTOS a
inner join TB_MARCAS b on a.codigo_ma = b.codigo_ma
inner join TB_UNIDADES_MEDIDAS c on a.codigo_um = c.codigo_um
inner join TB_SUBFAMILIAS d on a.codigo_sf = d.codigo_sf
inner join TB_AREA_DESPACHO e on a.codigo_ad = e.codigo_ad
where a.estado = 1 and
	upper(trim(cast(a.codigo_pr as char)) +
	trim(a.descripcion_pr) +
	trim(b.descripcion_ma) +
	trim(c.descripcion_um) +
	trim(d.descripcion_sf) +	
	trim(e.descripcion_ad)) like '%' + upper(trim(@cTexto)) + '%'
order by 1;	
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_pv]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_Listado_pv]
@cTexto varchar(30)=''
as
select codigo_pv, descripcion_pv
from TB_PUNTO_VENTA
where estado = 1 and 
upper(trim(cast (codigo_pv as char)))+
trim(descripcion_pv) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_sf]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Listado_sf]
@cTexto varchar(30)=''
as
select a.codigo_sf,
	   a.descripcion_sf,
	   b.descripcion_fa,
	   a.codigo_fa
from TB_SUBFAMILIAS a
inner join TB_FAMILIAS b on a.codigo_fa = b.codigo_fa
where a.estado = 1 and 
upper(trim(cast (a.codigo_fa as char)))+
trim(descripcion_sf) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Listado_um]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Listado_um]
@cTexto varchar(15)=''
as
select codigo_um, descripcion_um
from TB_UNIDADES_MEDIDAS
where estado = 1 and 
upper(trim(cast (codigo_um as char)))+
trim(descripcion_um) like '%' +upper(trim(@cTexto))+ '%'
order by 1;
GO
/****** Object:  StoredProcedure [dbo].[USP_Mostrar_img]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Mostrar_img]
@nCodigo_pr int=0
as
select imagen
from TB_IMAGEN_PRODUCTOS
where codigo_pr = @nCodigo_pr;
GO
/****** Object:  StoredProcedure [dbo].[USP_Mostrar_me_rp]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_Mostrar_me_rp]
@nCodigo_pv int=0
as
select a.codigo_me,
	   a.descripcion_me,
	   a.disponible,
	   a.codigo_pv,
	   b.descripcion_pv
from TB_Mesas a
inner join TB_PUNTO_VENTA b on a.codigo_pv=b.codigo_pv
where a.estado = 1 and a.codigo_pv=@nCodigo_pv
order by a.codigo_me
GO
/****** Object:  StoredProcedure [dbo].[USP_Puntos_Ventas_OK]    Script Date: 24/08/2022 20:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Puntos_Ventas_OK]
@nOpcion int=0,
@nCodigo_pr int=0
as
if @nOpcion = 1
	begin
		select descripcion_pv, 
			   0 as ok,
			   codigo_pv 
		from TB_PUNTO_VENTA where estado = 1
		order by codigo_pv;

	end;
else
	begin
		select b.descripcion_pv, 
			   a.disponible as ok,
			   a.codigo_pv 
		from TB_PRODUCTOS_DISPONIBLES_PV a
		inner join TB_PUNTO_VENTA b on a.codigo_pv = b.codigo_pv
		where a.codigo_pr = @nCodigo_pr
		order by a.codigo_pv;	
	end;
GO
USE [master]
GO
ALTER DATABASE [BD_PUNTOVENTA] SET  READ_WRITE 
GO
