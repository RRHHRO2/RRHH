USE [master]
GO
/****** Object:  Database [RRHH]    Script Date: 23/05/2025 05:25:10 p.m. ******/
CREATE DATABASE [RRHH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RRHH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RRHH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RRHH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RRHH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RRHH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RRHH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RRHH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RRHH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RRHH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RRHH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RRHH] SET ARITHABORT OFF 
GO
ALTER DATABASE [RRHH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RRHH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RRHH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RRHH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RRHH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RRHH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RRHH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RRHH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RRHH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RRHH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RRHH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RRHH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RRHH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RRHH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RRHH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RRHH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RRHH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RRHH] SET RECOVERY FULL 
GO
ALTER DATABASE [RRHH] SET  MULTI_USER 
GO
ALTER DATABASE [RRHH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RRHH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RRHH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RRHH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RRHH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RRHH', N'ON'
GO
ALTER DATABASE [RRHH] SET QUERY_STORE = OFF
GO
USE [RRHH]
GO
/****** Object:  Table [dbo].[AreasTrabajo]    Script Date: 23/05/2025 05:25:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreasTrabajo](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[NombreArea] [varchar](100) NOT NULL,
	[Descripcion] [text] NOT NULL,
 CONSTRAINT [PK__AreasTra__2FC141AA2BA1F424] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ausencias]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ausencias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[TipoAusencia] [varchar](50) NOT NULL,
	[Justificacion] [text] NOT NULL,
 CONSTRAINT [PK__Ausencia__3214EC07588F6D63] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratos]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoContrato] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK__Contrato__3214EC070B2BE7CE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[IdDepartamento] [int] NOT NULL,
	[Nombre] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[NumeroDocumento] [nvarchar](20) NOT NULL,
	[FechaExpedicion] [date] NOT NULL,
	[MunicipioExpedicion] [int] NOT NULL,
	[Nombres] [nvarchar](70) NOT NULL,
	[Apellidos] [nvarchar](70) NOT NULL,
	[LugarNacimiento] [int] NOT NULL,
	[Direccion] [nvarchar](70) NOT NULL,
	[Barrio] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](11) NULL,
	[Celular] [nvarchar](11) NULL,
	[Correo] [nvarchar](70) NOT NULL,
	[EPS] [int] NOT NULL,
	[FondoPension] [int] NOT NULL,
	[FondoCesantias] [int] NOT NULL,
	[IdAreaTrabajo] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados_Dependientes]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados_Dependientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[Apellidos] [nvarchar](70) NOT NULL,
	[Nombres] [nvarchar](70) NOT NULL,
	[TipoDependiente] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Empleados_Dependientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[IdMunicipio] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdDepartamento] [int] NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Roles__2A49584CC99005FF] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeguridadSocial]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguridadSocial](
	[IdSeguridadSocial] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](70) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SeguridadSocial] PRIMARY KEY CLUSTERED 
(
	[IdSeguridadSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposContrato]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposContrato](
	[IdTipoContrato] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TiposCon__F46C49C2A77402D8] PRIMARY KEY CLUSTERED 
(
	[IdTipoContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumento]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumento](
	[IdTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Abreviatura] [nchar](3) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/05/2025 05:25:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NOT NULL,
	[NombreCompleto] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasena] [varchar](100) NOT NULL,
	[HashKey] [binary](32) NOT NULL,
	[HashIV] [binary](16) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
 CONSTRAINT [PK__Usuarios__3214EC07759748C2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AreasTrabajo] ON 
GO
INSERT [dbo].[AreasTrabajo] ([IdArea], [NombreArea], [Descripcion]) VALUES (1, N'Tecnología de la Información', N'Área encargada de sistemas y soporte técnico.')
GO
INSERT [dbo].[AreasTrabajo] ([IdArea], [NombreArea], [Descripcion]) VALUES (2, N'Recursos Humanos', N'Área encargada de la gestión de personal.')
GO
SET IDENTITY_INSERT [dbo].[AreasTrabajo] OFF
GO
SET IDENTITY_INSERT [dbo].[Contratos] ON 
GO
INSERT [dbo].[Contratos] ([Id], [IdTipoContrato], [IdEmpleado], [FechaInicio], [FechaFin]) VALUES (4, 1, 1, CAST(N'2025-05-23' AS Date), CAST(N'2025-12-31' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Contratos] OFF
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (5, N'ANTIOQUIA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (8, N'ATLÁNTICO')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (11, N'BOGOTÁ, D.C.')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (13, N'BOLÍVAR')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (15, N'BOYACÁ')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (17, N'CALDAS')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (18, N'CAQUETÁ')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (19, N'CAUCA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (20, N'CESAR')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (23, N'CÓRDOBA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (25, N'CUNDINAMARCA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (27, N'CHOCÓ')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (41, N'HUILA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (44, N'LA GUAJIRA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (47, N'MAGDALENA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (50, N'META')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (52, N'NARIÑO')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (54, N'NORTE DE SANTANDER')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (63, N'QUINDIO')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (66, N'RISARALDA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (68, N'SANTANDER')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (70, N'SUCRE')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (73, N'TOLIMA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (76, N'VALLE DEL CAUCA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (81, N'ARAUCA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (85, N'CASANARE')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (86, N'PUTUMAYO')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (88, N'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (91, N'AMAZONAS')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (94, N'GUAINÍA')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (95, N'GUAVIARE')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (97, N'VAUPÉS')
GO
INSERT [dbo].[Departamentos] ([IdDepartamento], [Nombre]) VALUES (99, N'VICHADA')
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [IdTipoDocumento], [NumeroDocumento], [FechaExpedicion], [MunicipioExpedicion], [Nombres], [Apellidos], [LugarNacimiento], [Direccion], [Barrio], [Telefono], [Celular], [Correo], [EPS], [FondoPension], [FondoCesantias], [IdAreaTrabajo]) VALUES (1, 1, N'12345678901', CAST(N'2001-08-06' AS Date), 1008, N'PRueba', N'Prueba', 1008, N'hhlhlh', N'jhjkhjkhjk', N'6019090909', N'3101234567', N'aechavezguardo@gmail.com', 1, 2, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1, N'Abriaquí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (2, N'Acacías', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (3, N'Acandí', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (4, N'Acevedo', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (5, N'Achí', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (6, N'Agrado', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (7, N'Agua de Dios', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (8, N'Aguachica', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (9, N'Aguada', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (10, N'Aguadas', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (11, N'Aguazul', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (12, N'Agustín Codazzi', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (13, N'Aipe', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (14, N'Albania', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (15, N'Albania', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (16, N'Albania', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (17, N'Albán', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (18, N'Albán (San José)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (19, N'Alcalá', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (20, N'Alejandria', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (21, N'Algarrobo', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (22, N'Algeciras', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (23, N'Almaguer', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (24, N'Almeida', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (25, N'Alpujarra', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (26, N'Altamira', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (27, N'Alto Baudó (Pie de Pato)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (28, N'Altos del Rosario', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (29, N'Alvarado', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (30, N'Amagá', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (31, N'Amalfi', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (32, N'Ambalema', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (33, N'Anapoima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (34, N'Ancuya', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (35, N'Andalucía', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (36, N'Andes', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (37, N'Angelópolis', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (38, N'Angostura', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (39, N'Anolaima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (40, N'Anorí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (41, N'Anserma', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (42, N'Ansermanuevo', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (43, N'Anzoátegui', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (44, N'Anzá', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (45, N'Apartadó', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (46, N'Apulo', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (47, N'Apía', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (48, N'Aquitania', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (49, N'Aracataca', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (50, N'Aranzazu', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (51, N'Aratoca', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (52, N'Arauca', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (53, N'Arauquita', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (54, N'Arbeláez', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (55, N'Arboleda (Berruecos)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (56, N'Arboledas', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (57, N'Arboletes', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (58, N'Arcabuco', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (59, N'Arenal', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (60, N'Argelia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (61, N'Argelia', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (62, N'Argelia', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (63, N'Ariguaní (El Difícil)', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (64, N'Arjona', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (65, N'Armenia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (66, N'Armenia', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (67, N'Armero (Guayabal)', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (68, N'Arroyohondo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (69, N'Astrea', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (70, N'Ataco', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (71, N'Atrato (Yuto)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (72, N'Ayapel', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (73, N'Bagadó', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (74, N'Bahía Solano (Mútis)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (75, N'Bajo Baudó (Pizarro)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (76, N'Balboa', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (77, N'Balboa', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (78, N'Baranoa', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (79, N'Baraya', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (80, N'Barbacoas', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (81, N'Barbosa', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (82, N'Barbosa', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (83, N'Barichara', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (84, N'Barranca de Upía', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (85, N'Barrancabermeja', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (86, N'Barrancas', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (87, N'Barranco de Loba', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (88, N'Barranquilla', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (89, N'Becerríl', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (90, N'Belalcázar', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (91, N'Bello', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (92, N'Belmira', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (93, N'Beltrán', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (94, N'Belén', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (95, N'Belén', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (96, N'Belén de Bajirá', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (97, N'Belén de Umbría', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (98, N'Belén de los Andaquíes', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (99, N'Berbeo', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (100, N'Betania', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (101, N'Beteitiva', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (102, N'Betulia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (103, N'Betulia', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (104, N'Bituima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (105, N'Boavita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (106, N'Bochalema', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (107, N'Bogotá D.C.', 1, 11)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (108, N'Bojacá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (109, N'Bojayá (Bellavista)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (110, N'Bolívar', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (111, N'Bolívar', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (112, N'Bolívar', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (113, N'Bolívar', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (114, N'Bosconia', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (115, N'Boyacá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (116, N'Briceño', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (117, N'Briceño', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (118, N'Bucaramanga', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (119, N'Bucarasica', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (120, N'Buenaventura', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (121, N'Buenavista', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (122, N'Buenavista', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (123, N'Buenavista', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (124, N'Buenavista', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (125, N'Buenos Aires', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (126, N'Buesaco', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (127, N'Buga', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (128, N'Bugalagrande', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (129, N'Burítica', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (130, N'Busbanza', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (131, N'Cabrera', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (132, N'Cabrera', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (133, N'Cabuyaro', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (134, N'Cachipay', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (135, N'Caicedo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (136, N'Caicedonia', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (137, N'Caimito', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (138, N'Cajamarca', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (139, N'Cajibío', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (140, N'Cajicá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (141, N'Calamar', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (142, N'Calamar', 1, 95)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (143, N'Calarcá', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (144, N'Caldas', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (145, N'Caldas', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (146, N'Caldono', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (147, N'California', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (148, N'Calima (Darién)', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (149, N'Caloto', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (150, N'Calí', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (151, N'Campamento', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (152, N'Campo de la Cruz', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (153, N'Campoalegre', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (154, N'Campohermoso', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (155, N'Canalete', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (156, N'Candelaria', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (157, N'Candelaria', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (158, N'Cantagallo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (159, N'Cantón de San Pablo', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (160, N'Caparrapí', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (161, N'Capitanejo', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (162, N'Caracolí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (163, N'Caramanta', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (164, N'Carcasí', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (165, N'Carepa', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (166, N'Carmen de Apicalá', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (167, N'Carmen de Carupa', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (168, N'Carmen de Viboral', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (169, N'Carmen del Darién (CURBARADÓ)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (170, N'Carolina', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (171, N'Cartagena', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (172, N'Cartagena del Chairá', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (173, N'Cartago', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (174, N'Carurú', 1, 97)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (175, N'Casabianca', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (176, N'Castilla la Nueva', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (177, N'Caucasia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (178, N'Cañasgordas', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (179, N'Cepita', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (180, N'Cereté', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (181, N'Cerinza', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (182, N'Cerrito', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (183, N'Cerro San Antonio', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (184, N'Chachaguí', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (185, N'Chaguaní', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (186, N'Chalán', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (187, N'Chaparral', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (188, N'Charalá', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (189, N'Charta', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (190, N'Chigorodó', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (191, N'Chima', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (192, N'Chimichagua', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (193, N'Chimá', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (194, N'Chinavita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (195, N'Chinchiná', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (196, N'Chinácota', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (197, N'Chinú', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (198, N'Chipaque', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (199, N'Chipatá', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (200, N'Chiquinquirá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (201, N'Chiriguaná', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (202, N'Chiscas', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (203, N'Chita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (204, N'Chitagá', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (205, N'Chitaraque', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (206, N'Chivatá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (207, N'Chivolo', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (208, N'Choachí', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (209, N'Chocontá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (210, N'Chámeza', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (211, N'Chía', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (212, N'Chíquiza', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (213, N'Chívor', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (214, N'Cicuco', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (215, N'Cimitarra', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (216, N'Circasia', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (217, N'Cisneros', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (218, N'Ciénaga', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (219, N'Ciénaga', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (220, N'Ciénaga de Oro', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (221, N'Clemencia', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (222, N'Cocorná', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (223, N'Coello', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (224, N'Cogua', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (225, N'Colombia', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (226, N'Colosó (Ricaurte)', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (227, N'Colón', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (228, N'Colón (Génova)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (229, N'Concepción', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (230, N'Concepción', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (231, N'Concordia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (232, N'Concordia', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (233, N'Condoto', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (234, N'Confines', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (235, N'Consaca', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (236, N'Contadero', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (237, N'Contratación', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (238, N'Convención', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (239, N'Copacabana', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (240, N'Coper', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (241, N'Cordobá', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (242, N'Corinto', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (243, N'Coromoro', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (244, N'Corozal', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (245, N'Corrales', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (246, N'Cota', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (247, N'Cotorra', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (248, N'Covarachía', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (249, N'Coveñas', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (250, N'Coyaima', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (251, N'Cravo Norte', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (252, N'Cuaspud (Carlosama)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (253, N'Cubarral', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (254, N'Cubará', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (255, N'Cucaita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (256, N'Cucunubá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (257, N'Cucutilla', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (258, N'Cuitiva', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (259, N'Cumaral', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (260, N'Cumaribo', 1, 99)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (261, N'Cumbal', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (262, N'Cumbitara', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (263, N'Cunday', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (264, N'Curillo', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (265, N'Curití', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (266, N'Curumaní', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (267, N'Cáceres', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (268, N'Cáchira', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (269, N'Cácota', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (270, N'Cáqueza', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (271, N'Cértegui', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (272, N'Cómbita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (273, N'Córdoba', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (274, N'Córdoba', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (275, N'Cúcuta', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (276, N'Dabeiba', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (277, N'Dagua', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (278, N'Dibulla', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (279, N'Distracción', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (280, N'Dolores', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (281, N'Don Matías', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (282, N'Dos Quebradas', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (283, N'Duitama', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (284, N'Durania', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (285, N'Ebéjico', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (286, N'El Bagre', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (287, N'El Banco', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (288, N'El Cairo', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (289, N'El Calvario', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (290, N'El Carmen', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (291, N'El Carmen', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (292, N'El Carmen de Atrato', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (293, N'El Carmen de Bolívar', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (294, N'El Castillo', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (295, N'El Cerrito', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (296, N'El Charco', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (297, N'El Cocuy', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (298, N'El Colegio', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (299, N'El Copey', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (300, N'El Doncello', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (301, N'El Dorado', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (302, N'El Dovio', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (303, N'El Espino', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (304, N'El Guacamayo', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (305, N'El Guamo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (306, N'El Molino', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (307, N'El Paso', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (308, N'El Paujil', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (309, N'El Peñol', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (310, N'El Peñon', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (311, N'El Peñon', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (312, N'El Peñón', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (313, N'El Piñon', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (314, N'El Playón', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (315, N'El Retorno', 1, 95)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (316, N'El Retén', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (317, N'El Roble', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (318, N'El Rosal', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (319, N'El Rosario', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (320, N'El Tablón de Gómez', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (321, N'El Tambo', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (322, N'El Tambo', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (323, N'El Tarra', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (324, N'El Zulia', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (325, N'El Águila', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (326, N'Elías', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (327, N'Encino', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (328, N'Enciso', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (329, N'Entrerríos', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (330, N'Envigado', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (331, N'Espinal', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (332, N'Facatativá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (333, N'Falan', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (334, N'Filadelfia', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (335, N'Filandia', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (336, N'Firavitoba', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (337, N'Flandes', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (338, N'Florencia', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (339, N'Florencia', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (340, N'Floresta', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (341, N'Florida', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (342, N'Floridablanca', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (343, N'Florián', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (344, N'Fonseca', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (345, N'Fortúl', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (346, N'Fosca', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (347, N'Francisco Pizarro', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (348, N'Fredonia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (349, N'Fresno', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (350, N'Frontino', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (351, N'Fuente de Oro', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (352, N'Fundación', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (353, N'Funes', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (354, N'Funza', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (355, N'Fusagasugá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (356, N'Fómeque', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (357, N'Fúquene', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (358, N'Gachalá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (359, N'Gachancipá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (360, N'Gachantivá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (361, N'Gachetá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (362, N'Galapa', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (363, N'Galeras (Nueva Granada)', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (364, N'Galán', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (365, N'Gama', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (366, N'Gamarra', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (367, N'Garagoa', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (368, N'Garzón', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (369, N'Gigante', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (370, N'Ginebra', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (371, N'Giraldo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (372, N'Girardot', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (373, N'Girardota', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (374, N'Girón', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (375, N'Gonzalez', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (376, N'Gramalote', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (377, N'Granada', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (378, N'Granada', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (379, N'Granada', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (380, N'Guaca', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (381, N'Guacamayas', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (382, N'Guacarí', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (383, N'Guachavés', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (384, N'Guachené', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (385, N'Guachetá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (386, N'Guachucal', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (387, N'Guadalupe', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (388, N'Guadalupe', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (389, N'Guadalupe', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (390, N'Guaduas', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (391, N'Guaitarilla', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (392, N'Gualmatán', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (393, N'Guamal', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (394, N'Guamal', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (395, N'Guamo', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (396, N'Guapota', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (397, N'Guapí', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (398, N'Guaranda', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (399, N'Guarne', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (400, N'Guasca', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (401, N'Guatapé', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (402, N'Guataquí', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (403, N'Guatavita', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (404, N'Guateque', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (405, N'Guavatá', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (406, N'Guayabal de Siquima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (407, N'Guayabetal', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (408, N'Guayatá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (409, N'Guepsa', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (410, N'Guicán', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (411, N'Gutiérrez', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (412, N'Guática', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (413, N'Gámbita', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (414, N'Gámeza', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (415, N'Génova', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (416, N'Gómez Plata', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (417, N'Hacarí', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (418, N'Hatillo de Loba', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (419, N'Hato', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (420, N'Hato Corozal', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (421, N'Hatonuevo', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (422, N'Heliconia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (423, N'Herrán', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (424, N'Herveo', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (425, N'Hispania', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (426, N'Hobo', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (427, N'Honda', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (428, N'Ibagué', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (429, N'Icononzo', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (430, N'Iles', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (431, N'Imúes', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (432, N'Inzá', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (433, N'Inírida', 1, 94)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (434, N'Ipiales', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (435, N'Isnos', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (436, N'Istmina', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (437, N'Itagüí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (438, N'Ituango', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (439, N'Izá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (440, N'Jambaló', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (441, N'Jamundí', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (442, N'Jardín', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (443, N'Jenesano', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (444, N'Jericó', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (445, N'Jericó', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (446, N'Jerusalén', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (447, N'Jesús María', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (448, N'Jordán', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (449, N'Juan de Acosta', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (450, N'Junín', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (451, N'Juradó', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (452, N'La Apartada y La Frontera', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (453, N'La Argentina', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (454, N'La Belleza', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (455, N'La Calera', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (456, N'La Capilla', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (457, N'La Ceja', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (458, N'La Celia', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (459, N'La Cruz', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (460, N'La Cumbre', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (461, N'La Dorada', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (462, N'La Esperanza', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (463, N'La Estrella', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (464, N'La Florida', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (465, N'La Gloria', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (466, N'La Jagua de Ibirico', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (467, N'La Jagua del Pilar', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (468, N'La Llanada', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (469, N'La Macarena', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (470, N'La Merced', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (471, N'La Mesa', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (472, N'La Montañita', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (473, N'La Palma', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (474, N'La Paz', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (475, N'La Paz (Robles)', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (476, N'La Peña', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (477, N'La Pintada', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (478, N'La Plata', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (479, N'La Playa', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (480, N'La Primavera', 1, 99)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (481, N'La Salina', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (482, N'La Sierra', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (483, N'La Tebaida', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (484, N'La Tola', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (485, N'La Unión', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (486, N'La Unión', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (487, N'La Unión', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (488, N'La Unión', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (489, N'La Uvita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (490, N'La Vega', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (491, N'La Vega', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (492, N'La Victoria', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (493, N'La Victoria', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (494, N'La Victoria', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (495, N'La Virginia', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (496, N'Labateca', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (497, N'Labranzagrande', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (498, N'Landázuri', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (499, N'Lebrija', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (500, N'Leiva', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (501, N'Lejanías', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (502, N'Lenguazaque', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (503, N'Leticia', 1, 91)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (504, N'Liborina', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (505, N'Linares', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (506, N'Lloró', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (507, N'Lorica', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (508, N'Los Córdobas', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (509, N'Los Palmitos', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (510, N'Los Patios', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (511, N'Los Santos', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (512, N'Lourdes', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (513, N'Luruaco', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (514, N'Lérida', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (515, N'Líbano', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (516, N'López (Micay)', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (517, N'Macanal', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (518, N'Macaravita', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (519, N'Maceo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (520, N'Machetá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (521, N'Madrid', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (522, N'Magangué', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (523, N'Magüi (Payán)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (524, N'Mahates', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (525, N'Maicao', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (526, N'Majagual', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (527, N'Malambo', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (528, N'Mallama (Piedrancha)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (529, N'Manatí', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (530, N'Manaure', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (531, N'Manaure Balcón del Cesar', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (532, N'Manizales', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (533, N'Manta', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (534, N'Manzanares', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (535, N'Maní', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (536, N'Mapiripan', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (537, N'Margarita', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (538, N'Marinilla', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (539, N'Maripí', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (540, N'Mariquita', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (541, N'Marmato', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (542, N'Marquetalia', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (543, N'Marsella', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (544, N'Marulanda', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (545, N'María la Baja', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (546, N'Matanza', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (547, N'Medellín', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (548, N'Medina', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (549, N'Medio Atrato', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (550, N'Medio Baudó', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (551, N'Medio San Juan (ANDAGOYA)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (552, N'Melgar', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (553, N'Mercaderes', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (554, N'Mesetas', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (555, N'Milán', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (556, N'Miraflores', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (557, N'Miraflores', 1, 95)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (558, N'Miranda', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (559, N'Mistrató', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (560, N'Mitú', 1, 97)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (561, N'Mocoa', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (562, N'Mogotes', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (563, N'Molagavita', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (564, N'Momil', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (565, N'Mompós', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (566, N'Mongua', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (567, N'Monguí', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (568, N'Moniquirá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (569, N'Montebello', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (570, N'Montecristo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (571, N'Montelíbano', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (572, N'Montenegro', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (573, N'Monteria', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (574, N'Monterrey', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (575, N'Morales', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (576, N'Morales', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (577, N'Morelia', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (578, N'Morroa', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (579, N'Mosquera', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (580, N'Mosquera', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (581, N'Motavita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (582, N'Moñitos', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (583, N'Murillo', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (584, N'Murindó', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (585, N'Mutatá', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (586, N'Mutiscua', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (587, N'Muzo', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (588, N'Málaga', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (589, N'Nariño', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (590, N'Nariño', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (591, N'Nariño', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (592, N'Natagaima', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (593, N'Nechí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (594, N'Necoclí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (595, N'Neira', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (596, N'Neiva', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (597, N'Nemocón', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (598, N'Nilo', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (599, N'Nimaima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (600, N'Nobsa', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (601, N'Nocaima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (602, N'Norcasia', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (603, N'Norosí', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (604, N'Novita', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (605, N'Nueva Granada', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (606, N'Nuevo Colón', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (607, N'Nunchía', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (608, N'Nuquí', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (609, N'Nátaga', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (610, N'Obando', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (611, N'Ocamonte', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (612, N'Ocaña', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (613, N'Oiba', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (614, N'Oicatá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (615, N'Olaya', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (616, N'Olaya Herrera', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (617, N'Onzaga', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (618, N'Oporapa', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (619, N'Orito', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (620, N'Orocué', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (621, N'Ortega', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (622, N'Ospina', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (623, N'Otanche', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (624, N'Ovejas', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (625, N'Pachavita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (626, N'Pacho', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (627, N'Padilla', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (628, N'Paicol', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (629, N'Pailitas', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (630, N'Paime', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (631, N'Paipa', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (632, N'Pajarito', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (633, N'Palermo', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (634, N'Palestina', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (635, N'Palestina', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (636, N'Palmar', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (637, N'Palmar de Varela', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (638, N'Palmas del Socorro', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (639, N'Palmira', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (640, N'Palmito', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (641, N'Palocabildo', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (642, N'Pamplona', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (643, N'Pamplonita', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (644, N'Pandi', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (645, N'Panqueba', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (646, N'Paratebueno', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (647, N'Pasca', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (648, N'Patía (El Bordo)', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (649, N'Pauna', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (650, N'Paya', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (651, N'Paz de Ariporo', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (652, N'Paz de Río', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (653, N'Pedraza', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (654, N'Pelaya', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (655, N'Pensilvania', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (656, N'Peque', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (657, N'Pereira', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (658, N'Pesca', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (659, N'Peñol', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (660, N'Piamonte', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (661, N'Pie de Cuesta', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (662, N'Piedras', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (663, N'Piendamó', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (664, N'Pijao', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (665, N'Pijiño', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (666, N'Pinchote', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (667, N'Pinillos', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (668, N'Piojo', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (669, N'Pisva', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (670, N'Pital', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (671, N'Pitalito', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (672, N'Pivijay', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (673, N'Planadas', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (674, N'Planeta Rica', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (675, N'Plato', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (676, N'Policarpa', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (677, N'Polonuevo', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (678, N'Ponedera', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (679, N'Popayán', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (680, N'Pore', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (681, N'Potosí', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (682, N'Pradera', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (683, N'Prado', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (684, N'Providencia', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (685, N'Providencia', 1, 88)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (686, N'Pueblo Bello', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (687, N'Pueblo Nuevo', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (688, N'Pueblo Rico', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (689, N'Pueblorrico', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (690, N'Puebloviejo', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (691, N'Puente Nacional', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (692, N'Puerres', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (693, N'Puerto Asís', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (694, N'Puerto Berrío', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (695, N'Puerto Boyacá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (696, N'Puerto Caicedo', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (697, N'Puerto Carreño', 1, 99)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (698, N'Puerto Colombia', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (699, N'Puerto Concordia', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (700, N'Puerto Escondido', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (701, N'Puerto Gaitán', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (702, N'Puerto Guzmán', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (703, N'Puerto Leguízamo', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (704, N'Puerto Libertador', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (705, N'Puerto Lleras', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (706, N'Puerto López', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (707, N'Puerto Nare', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (708, N'Puerto Nariño', 1, 91)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (709, N'Puerto Parra', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (710, N'Puerto Rico', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (711, N'Puerto Rico', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (712, N'Puerto Rondón', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (713, N'Puerto Salgar', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (714, N'Puerto Santander', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (715, N'Puerto Tejada', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (716, N'Puerto Triunfo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (717, N'Puerto Wilches', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (718, N'Pulí', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (719, N'Pupiales', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (720, N'Puracé (Coconuco)', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (721, N'Purificación', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (722, N'Purísima', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (723, N'Pácora', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (724, N'Páez', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (725, N'Páez (Belalcazar)', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (726, N'Páramo', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (727, N'Quebradanegra', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (728, N'Quetame', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (729, N'Quibdó', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (730, N'Quimbaya', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (731, N'Quinchía', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (732, N'Quipama', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (733, N'Quipile', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (734, N'Ragonvalia', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (735, N'Ramiriquí', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (736, N'Recetor', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (737, N'Regidor', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (738, N'Remedios', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (739, N'Remolino', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (740, N'Repelón', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (741, N'Restrepo', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (742, N'Restrepo', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (743, N'Retiro', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (744, N'Ricaurte', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (745, N'Ricaurte', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (746, N'Rio Negro', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (747, N'Rioblanco', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (748, N'Riofrío', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (749, N'Riohacha', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (750, N'Risaralda', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (751, N'Rivera', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (752, N'Roberto Payán (San José)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (753, N'Roldanillo', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (754, N'Roncesvalles', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (755, N'Rondón', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (756, N'Rosas', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (757, N'Rovira', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (758, N'Ráquira', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (759, N'Río Iró', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (760, N'Río Quito', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (761, N'Río Sucio', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (762, N'Río Viejo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (763, N'Río de oro', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (764, N'Ríonegro', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (765, N'Ríosucio', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (766, N'Sabana de Torres', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (767, N'Sabanagrande', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (768, N'Sabanalarga', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (769, N'Sabanalarga', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (770, N'Sabanalarga', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (771, N'Sabanas de San Angel (SAN ANGEL)', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (772, N'Sabaneta', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (773, N'Saboyá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (774, N'Sahagún', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (775, N'Saladoblanco', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (776, N'Salamina', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (777, N'Salamina', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (778, N'Salazar', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (779, N'Saldaña', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (780, N'Salento', 1, 63)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (781, N'Salgar', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (782, N'Samacá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (783, N'Samaniego', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (784, N'Samaná', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (785, N'Sampués', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (786, N'San Agustín', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (787, N'San Alberto', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (788, N'San Andrés', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (789, N'San Andrés Sotavento', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (790, N'San Andrés de Cuerquía', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (791, N'San Antero', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (792, N'San Antonio', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (793, N'San Antonio de Tequendama', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (794, N'San Benito', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (795, N'San Benito Abad', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (796, N'San Bernardo', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (797, N'San Bernardo', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (798, N'San Bernardo del Viento', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (799, N'San Calixto', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (800, N'San Carlos', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (801, N'San Carlos', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (802, N'San Carlos de Guaroa', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (803, N'San Cayetano', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (804, N'San Cayetano', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (805, N'San Cristobal', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (806, N'San Diego', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (807, N'San Eduardo', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (808, N'San Estanislao', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (809, N'San Fernando', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (810, N'San Francisco', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (811, N'San Francisco', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (812, N'San Francisco', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (813, N'San Gíl', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (814, N'San Jacinto', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (815, N'San Jacinto del Cauca', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (816, N'San Jerónimo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (817, N'San Joaquín', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (818, N'San José', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (819, N'San José de Miranda', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (820, N'San José de Montaña', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (821, N'San José de Pare', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (822, N'San José de Uré', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (823, N'San José del Fragua', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (824, N'San José del Guaviare', 1, 95)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (825, N'San José del Palmar', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (826, N'San Juan de Arama', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (827, N'San Juan de Betulia', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (828, N'San Juan de Nepomuceno', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (829, N'San Juan de Pasto', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (830, N'San Juan de Río Seco', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (831, N'San Juan de Urabá', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (832, N'San Juan del Cesar', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (833, N'San Juanito', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (834, N'San Lorenzo', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (835, N'San Luis', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (836, N'San Luís', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (837, N'San Luís de Gaceno', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (838, N'San Luís de Palenque', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (839, N'San Marcos', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (840, N'San Martín', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (841, N'San Martín', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (842, N'San Martín de Loba', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (843, N'San Mateo', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (844, N'San Miguel', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (845, N'San Miguel', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (846, N'San Miguel de Sema', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (847, N'San Onofre', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (848, N'San Pablo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (849, N'San Pablo', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (850, N'San Pablo de Borbur', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (851, N'San Pedro', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (852, N'San Pedro', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (853, N'San Pedro', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (854, N'San Pedro de Cartago', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (855, N'San Pedro de Urabá', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (856, N'San Pelayo', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (857, N'San Rafael', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (858, N'San Roque', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (859, N'San Sebastián', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (860, N'San Sebastián de Buenavista', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (861, N'San Vicente', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (862, N'San Vicente del Caguán', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (863, N'San Vicente del Chucurí', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (864, N'San Zenón', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (865, N'Sandoná', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (866, N'Santa Ana', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (867, N'Santa Bárbara', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (868, N'Santa Bárbara', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (869, N'Santa Bárbara (Iscuandé)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (870, N'Santa Bárbara de Pinto', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (871, N'Santa Catalina', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (872, N'Santa Fé de Antioquia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (873, N'Santa Genoveva de Docorodó', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (874, N'Santa Helena del Opón', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (875, N'Santa Isabel', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (876, N'Santa Lucía', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (877, N'Santa Marta', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (878, N'Santa María', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (879, N'Santa María', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (880, N'Santa Rosa', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (881, N'Santa Rosa', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (882, N'Santa Rosa de Cabal', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (883, N'Santa Rosa de Osos', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (884, N'Santa Rosa de Viterbo', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (885, N'Santa Rosa del Sur', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (886, N'Santa Rosalía', 1, 99)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (887, N'Santa Sofía', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (888, N'Santana', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (889, N'Santander de Quilichao', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (890, N'Santiago', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (891, N'Santiago', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (892, N'Santo Domingo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (893, N'Santo Tomás', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (894, N'Santuario', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (895, N'Santuario', 1, 66)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (896, N'Sapuyes', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (897, N'Saravena', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (898, N'Sardinata', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (899, N'Sasaima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (900, N'Sativanorte', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (901, N'Sativasur', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (902, N'Segovia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (903, N'Sesquilé', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (904, N'Sevilla', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (905, N'Siachoque', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (906, N'Sibaté', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (907, N'Sibundoy', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (908, N'Silos', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (909, N'Silvania', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (910, N'Silvia', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (911, N'Simacota', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (912, N'Simijaca', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (913, N'Simití', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (914, N'Sincelejo', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (915, N'Sincé', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (916, N'Sipí', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (917, N'Sitionuevo', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (918, N'Soacha', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (919, N'Soatá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (920, N'Socha', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (921, N'Socorro', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (922, N'Socotá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (923, N'Sogamoso', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (924, N'Solano', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (925, N'Soledad', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (926, N'Solita', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (927, N'Somondoco', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (928, N'Sonsón', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (929, N'Sopetrán', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (930, N'Soplaviento', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (931, N'Sopó', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (932, N'Sora', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (933, N'Soracá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (934, N'Sotaquirá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (935, N'Sotara (Paispamba)', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (936, N'Sotomayor (Los Andes)', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (937, N'Suaita', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (938, N'Suan', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (939, N'Suaza', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (940, N'Subachoque', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (941, N'Sucre', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (942, N'Sucre', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (943, N'Sucre', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (944, N'Suesca', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (945, N'Supatá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (946, N'Supía', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (947, N'Suratá', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (948, N'Susa', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (949, N'Susacón', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (950, N'Sutamarchán', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (951, N'Sutatausa', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (952, N'Sutatenza', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (953, N'Suárez', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (954, N'Suárez', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (955, N'Sácama', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (956, N'Sáchica', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (957, N'Tabio', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (958, N'Tadó', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (959, N'Talaigua Nuevo', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (960, N'Tamalameque', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (961, N'Tame', 1, 81)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (962, N'Taminango', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (963, N'Tangua', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (964, N'Taraira', 1, 97)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (965, N'Tarazá', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (966, N'Tarqui', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (967, N'Tarso', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (968, N'Tasco', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (969, N'Tauramena', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (970, N'Tausa', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (971, N'Tello', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (972, N'Tena', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (973, N'Tenerife', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (974, N'Tenjo', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (975, N'Tenza', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (976, N'Teorama', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (977, N'Teruel', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (978, N'Tesalia', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (979, N'Tibacuy', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (980, N'Tibaná', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (981, N'Tibasosa', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (982, N'Tibirita', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (983, N'Tibú', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (984, N'Tierralta', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (985, N'Timaná', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (986, N'Timbiquí', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (987, N'Timbío', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (988, N'Tinjacá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (989, N'Tipacoque', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (990, N'Tiquisio (Puerto Rico)', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (991, N'Titiribí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (992, N'Toca', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (993, N'Tocaima', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (994, N'Tocancipá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (995, N'Toguí', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (996, N'Toledo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (997, N'Toledo', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (998, N'Tolú', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (999, N'Tolú Viejo', 1, 70)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1000, N'Tona', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1001, N'Topagá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1002, N'Topaipí', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1003, N'Toribío', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1004, N'Toro', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1005, N'Tota', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1006, N'Totoró', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1007, N'Trinidad', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1008, N'Trujillo', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1009, N'Tubará', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1010, N'Tuchín', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1011, N'Tulúa', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1012, N'Tumaco', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1013, N'Tunja', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1014, N'Tunungua', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1015, N'Turbaco', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1016, N'Turbaná', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1017, N'Turbo', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1018, N'Turmequé', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1019, N'Tuta', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1020, N'Tutasá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1021, N'Támara', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1022, N'Támesis', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1023, N'Túquerres', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1024, N'Ubalá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1025, N'Ubaque', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1026, N'Ubaté', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1027, N'Ulloa', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1028, N'Une', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1029, N'Unguía', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1030, N'Unión Panamericana (ÁNIMAS)', 1, 27)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1031, N'Uramita', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1032, N'Uribe', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1033, N'Uribia', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1034, N'Urrao', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1035, N'Urumita', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1036, N'Usiacuri', 1, 8)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1037, N'Valdivia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1038, N'Valencia', 1, 23)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1039, N'Valle de San José', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1040, N'Valle de San Juan', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1041, N'Valle del Guamuez', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1042, N'Valledupar', 1, 20)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1043, N'Valparaiso', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1044, N'Valparaiso', 1, 18)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1045, N'Vegachí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1046, N'Venadillo', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1047, N'Venecia', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1048, N'Venecia (Ospina Pérez)', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1049, N'Ventaquemada', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1050, N'Vergara', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1051, N'Versalles', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1052, N'Vetas', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1053, N'Viani', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1054, N'Vigía del Fuerte', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1055, N'Vijes', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1056, N'Villa Caro', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1057, N'Villa Rica', 1, 19)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1058, N'Villa de Leiva', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1059, N'Villa del Rosario', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1060, N'Villagarzón', 1, 86)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1061, N'Villagómez', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1062, N'Villahermosa', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1063, N'Villamaría', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1064, N'Villanueva', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1065, N'Villanueva', 1, 44)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1066, N'Villanueva', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1067, N'Villanueva', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1068, N'Villapinzón', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1069, N'Villarrica', 1, 73)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1070, N'Villavicencio', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1071, N'Villavieja', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1072, N'Villeta', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1073, N'Viotá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1074, N'Viracachá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1075, N'Vista Hermosa', 1, 50)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1076, N'Viterbo', 1, 17)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1077, N'Vélez', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1078, N'Yacopí', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1079, N'Yacuanquer', 1, 52)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1080, N'Yaguará', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1081, N'Yalí', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1082, N'Yarumal', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1083, N'Yolombó', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1084, N'Yondó (Casabe)', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1085, N'Yopal', 1, 85)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1086, N'Yotoco', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1087, N'Yumbo', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1088, N'Zambrano', 1, 13)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1089, N'Zapatoca', 1, 68)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1090, N'Zapayán (PUNTA DE PIEDRAS)', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1091, N'Zaragoza', 1, 5)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1092, N'Zarzal', 1, 76)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1093, N'Zetaquirá', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1094, N'Zipacón', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1095, N'Zipaquirá', 1, 25)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1096, N'Zona Bananera (PRADO - SEVILLA)', 1, 47)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1097, N'Ábrego', 1, 54)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1098, N'Íquira', 1, 41)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1099, N'Úmbita', 1, 15)
GO
INSERT [dbo].[Municipios] ([IdMunicipio], [Nombre], [Estado], [IdDepartamento]) VALUES (1100, N'Útica', 1, 25)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([IdRol], [NombreRol]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[Roles] ([IdRol], [NombreRol]) VALUES (2, N'Usuario')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadSocial] ON 
GO
INSERT [dbo].[SeguridadSocial] ([IdSeguridadSocial], [Nombre], [Tipo]) VALUES (1, N'Compensar EPS', N'Salud')
GO
INSERT [dbo].[SeguridadSocial] ([IdSeguridadSocial], [Nombre], [Tipo]) VALUES (2, N'Colpensiones', N'Pension')
GO
INSERT [dbo].[SeguridadSocial] ([IdSeguridadSocial], [Nombre], [Tipo]) VALUES (3, N'Fondo Nacional del Ahorro', N'Cesantias')
GO
SET IDENTITY_INSERT [dbo].[SeguridadSocial] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposContrato] ON 
GO
INSERT [dbo].[TiposContrato] ([IdTipoContrato], [NombreTipo]) VALUES (1, N'Indefinido')
GO
INSERT [dbo].[TiposContrato] ([IdTipoContrato], [NombreTipo]) VALUES (2, N'Temporal')
GO
INSERT [dbo].[TiposContrato] ([IdTipoContrato], [NombreTipo]) VALUES (3, N'Por Proyecto')
GO
SET IDENTITY_INSERT [dbo].[TiposContrato] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] ON 
GO
INSERT [dbo].[TiposDocumento] ([IdTipoDocumento], [Nombre], [Abreviatura]) VALUES (1, N'Cedula de Ciudadania', N'CC ')
GO
INSERT [dbo].[TiposDocumento] ([IdTipoDocumento], [Nombre], [Abreviatura]) VALUES (2, N'Pasaporte', N'PP ')
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([Id], [Cedula], [NombreCompleto], [Correo], [Contrasena], [HashKey], [HashIV], [IdRol], [IdArea]) VALUES (3, 1140832410, N'Andres Chavez Guardo', N'aechavezguardo@gmail.com', N'Sd32aiWZ4torRXj9NsTZYQ==', 0x91C28594A36B5A1F30840E3A20F931B797A4C82026975553131F7FD344CB9F95, 0x2194DBAC10A57415F16327C98F34EACD, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  Index [UQ__Usuarios__B4ADFE38BF1ED160]    Script Date: 23/05/2025 05:25:11 p.m. ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ__Usuarios__B4ADFE38BF1ED160] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ausencias]  WITH CHECK ADD  CONSTRAINT [FK__Ausencias__Cedul__4BAC3F29] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Ausencias] CHECK CONSTRAINT [FK__Ausencias__Cedul__4BAC3F29]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK__Contratos__IdTip__48CFD27E] FOREIGN KEY([IdTipoContrato])
REFERENCES [dbo].[TiposContrato] ([IdTipoContrato])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK__Contratos__IdTip__48CFD27E]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Empleados]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Empleados]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_LugarNacimiento] FOREIGN KEY([LugarNacimiento])
REFERENCES [dbo].[Municipios] ([IdMunicipio])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_LugarNacimiento]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Municipios] FOREIGN KEY([MunicipioExpedicion])
REFERENCES [dbo].[Municipios] ([IdMunicipio])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Municipios]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_SeguridadSocial] FOREIGN KEY([EPS])
REFERENCES [dbo].[SeguridadSocial] ([IdSeguridadSocial])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_SeguridadSocial]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_SeguridadSocial1] FOREIGN KEY([FondoPension])
REFERENCES [dbo].[SeguridadSocial] ([IdSeguridadSocial])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_SeguridadSocial1]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_SeguridadSocial2] FOREIGN KEY([FondoCesantias])
REFERENCES [dbo].[SeguridadSocial] ([IdSeguridadSocial])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_SeguridadSocial2]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_TiposDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[TiposDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_TiposDocumento]
GO
ALTER TABLE [dbo].[Empleados_Dependientes]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Dependientes_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Empleados_Dependientes] CHECK CONSTRAINT [FK_Empleados_Dependientes_Empleados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_AreasTrabajo] FOREIGN KEY([IdArea])
REFERENCES [dbo].[AreasTrabajo] ([IdArea])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_AreasTrabajo]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
USE [master]
GO
ALTER DATABASE [RRHH] SET  READ_WRITE 
GO
