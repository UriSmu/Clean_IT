USE [Clean IT]
GO
/****** Object:  Table [dbo].[Cleaners]    Script Date: 21/11/2024 15:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cleaners](
	[idCleaner] [int] IDENTITY(1,1) NOT NULL,
	[nacionalidad_cleaner] [varchar](50) NOT NULL,
	[foto_cleaner] [image] NOT NULL,
	[direccion_cleaner] [varchar](255) NOT NULL,
	[experiencia_cleaner] [varchar](100) NOT NULL,
	[antecedentes_cleaner] [image] NOT NULL,
	[descripcion_cleaner] [varchar](255) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[idReseñaCle] [int] NOT NULL,
 CONSTRAINT [PK_Cleaners] PRIMARY KEY CLUSTERED 
(
	[idCleaner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nacionalidad_cliente] [varchar](50) NOT NULL,
	[foto_cliente] [image] NOT NULL,
	[direccion_cliente] [varchar](255) NOT NULL,
	[descripcion_cliente] [varchar](255) NOT NULL,
	[antecedentes_cliente] [image] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[idReseñaCli] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasDeSeguridad]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasDeSeguridad](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Texto_Pregunta] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PreguntasDeSeguridad] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[imagen] [image] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñasCleaner]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñasCleaner](
	[idReseñaCle] [int] IDENTITY(1,1) NOT NULL,
	[cant_estrellas] [int] NOT NULL,
	[calificacion_trato] [int] NOT NULL,
	[calificacion_servicio] [int] NOT NULL,
	[opciones_seleccionadas] [varchar](255) NULL,
	[comentarios] [varchar](255) NULL,
 CONSTRAINT [PK_ReseñaCleaner] PRIMARY KEY CLUSTERED 
(
	[idReseñaCle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñasCliente]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñasCliente](
	[idReseñaCli] [int] NOT NULL,
	[cant_estrellas] [int] NOT NULL,
	[calificacion_trato] [int] NOT NULL,
	[opciones_seleccionadas] [varchar](255) NOT NULL,
	[comentarios] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ReseñasCliente] PRIMARY KEY CLUSTERED 
(
	[idReseñaCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestasPreguntas]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestasPreguntas](
	[IdUsuario] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Texto_Respuesta] [varchar](255) NOT NULL,
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RespuestasPreguntas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicios] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[imagen] [image] NOT NULL,
	[texto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudCleaner]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudCleaner](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[servicio] [varchar](50) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idCleaner] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Email] [varchar](255) NULL,
	[Telefono] [varchar](50) NULL,
	[Documento] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](50) NOT NULL,
	[Foto] [varchar](250) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosPreguntas]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosPreguntas](
	[IdUsuario] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[IdRespuesta] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PreguntasDeSeguridad] ON 

INSERT [dbo].[PreguntasDeSeguridad] ([IdPregunta], [Texto_Pregunta]) VALUES (1, N'¿Cual es tu color favorito?')
INSERT [dbo].[PreguntasDeSeguridad] ([IdPregunta], [Texto_Pregunta]) VALUES (2, N'¿Cual es tu equipo favorito?')
INSERT [dbo].[PreguntasDeSeguridad] ([IdPregunta], [Texto_Pregunta]) VALUES (3, N'¿Cual es tu comida favorita?')
INSERT [dbo].[PreguntasDeSeguridad] ([IdPregunta], [Texto_Pregunta]) VALUES (4, N'¿En que escuela hiciste tu primario?')
INSERT [dbo].[PreguntasDeSeguridad] ([IdPregunta], [Texto_Pregunta]) VALUES (5, N'¿En que escuela hiciste el secundario?')
SET IDENTITY_INSERT [dbo].[PreguntasDeSeguridad] OFF
GO
SET IDENTITY_INSERT [dbo].[RespuestasPreguntas] ON 

INSERT [dbo].[RespuestasPreguntas] ([IdUsuario], [IdPregunta], [Texto_Respuesta], [IdRespuesta]) VALUES (1, 2, N'Estudiantes', 1)
INSERT [dbo].[RespuestasPreguntas] ([IdUsuario], [IdPregunta], [Texto_Respuesta], [IdRespuesta]) VALUES (2, 1, N'Rojo', 2)
SET IDENTITY_INSERT [dbo].[RespuestasPreguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Username], [Nombre], [Apellido], [Email], [Telefono], [Documento], [Contrasenia], [Foto]) VALUES (1, N'Urismu', N'Uriel', N'Smucler', N'48240113@est.ort.edu.ar', N'1123895698', N'48240113', N'Popi2023!', NULL)
INSERT [dbo].[Usuarios] ([IdUsuario], [Username], [Nombre], [Apellido], [Email], [Telefono], [Documento], [Contrasenia], [Foto]) VALUES (2, N'leok', N'Leo', N'Kristal', N'leo@kristal.com', N'12345566', N'22222222', N'111111A@', N'leo.jpeg')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
INSERT [dbo].[UsuariosPreguntas] ([IdUsuario], [IdPregunta], [IdRespuesta]) VALUES (1, 2, 1)
INSERT [dbo].[UsuariosPreguntas] ([IdUsuario], [IdPregunta], [IdRespuesta]) VALUES (2, 1, 2)
GO
ALTER TABLE [dbo].[Cleaners]  WITH CHECK ADD  CONSTRAINT [FK_Cleaners_ReseñasCleaner1] FOREIGN KEY([idReseñaCle])
REFERENCES [dbo].[ReseñasCleaner] ([idReseñaCle])
GO
ALTER TABLE [dbo].[Cleaners] CHECK CONSTRAINT [FK_Cleaners_ReseñasCleaner1]
GO
ALTER TABLE [dbo].[Cleaners]  WITH CHECK ADD  CONSTRAINT [FK_Cleaners_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cleaners] CHECK CONSTRAINT [FK_Cleaners_Usuarios]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_ReseñasCliente] FOREIGN KEY([idReseñaCli])
REFERENCES [dbo].[ReseñasCliente] ([idReseñaCli])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_ReseñasCliente]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Usuarios]
GO
ALTER TABLE [dbo].[RespuestasPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_RespuestasPreguntas_PreguntasDeSeguridad] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[PreguntasDeSeguridad] ([IdPregunta])
GO
ALTER TABLE [dbo].[RespuestasPreguntas] CHECK CONSTRAINT [FK_RespuestasPreguntas_PreguntasDeSeguridad]
GO
ALTER TABLE [dbo].[RespuestasPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_RespuestasPreguntas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[RespuestasPreguntas] CHECK CONSTRAINT [FK_RespuestasPreguntas_Usuarios]
GO
ALTER TABLE [dbo].[SolicitudCleaner]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudCleaner_Cleaners] FOREIGN KEY([idCleaner])
REFERENCES [dbo].[Cleaners] ([idCleaner])
GO
ALTER TABLE [dbo].[SolicitudCleaner] CHECK CONSTRAINT [FK_SolicitudCleaner_Cleaners]
GO
ALTER TABLE [dbo].[SolicitudCleaner]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudCleaner_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[SolicitudCleaner] CHECK CONSTRAINT [FK_SolicitudCleaner_Clientes]
GO
ALTER TABLE [dbo].[UsuariosPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosPreguntas_PreguntasDeSeguridad] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[PreguntasDeSeguridad] ([IdPregunta])
GO
ALTER TABLE [dbo].[UsuariosPreguntas] CHECK CONSTRAINT [FK_UsuariosPreguntas_PreguntasDeSeguridad]
GO
ALTER TABLE [dbo].[UsuariosPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosPreguntas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuariosPreguntas] CHECK CONSTRAINT [FK_UsuariosPreguntas_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesion](
@pInicio VARCHAR(255),
@pContrasenia VARCHAR(255)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Usuarios WHERE (Email = @pInicio OR Username = @pInicio OR Telefono = @pInicio) AND Contrasenia = @pContrasenia)
    BEGIN
        SELECT 1
    END
    ELSE
    BEGIN
        SELECT 0
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarUsuario] (
@pEmail VARCHAR(255),
@pUsuario VARCHAR(255),
@pNombre VARCHAR(255),
@pApellido VARCHAR(255),
@pTelefono VARCHAR(255),
@pDocumento VARCHAR(255),
@pContrasenia VARCHAR(255),
@pIdPregunta INT,
@pRespuestaSeguridad VARCHAR(255),
@pFoto VARCHAR(250)
)
AS
BEGIN
	IF (SELECT COUNT(1) FROM Usuarios WHERE Email = @pEmail or Telefono = @pTelefono) = 0
	BEGIN
		DECLARE @UserId INT;
		INSERT INTO Usuarios (Username, Nombre, Apellido, Email, Telefono, Documento, Contrasenia, Foto)
		VALUES (@pUsuario, @pNombre, @pApellido, @pEmail, @pTelefono, @pDocumento, @pContrasenia, @pFoto);

		SET @UserId = SCOPE_IDENTITY();

		INSERT INTO RespuestasPreguntas (IdUsuario, IdPregunta, Texto_Respuesta)
		VALUES (@UserId, @pIdPregunta, @pRespuestaSeguridad);

		DECLARE @RespuestaId INT = SCOPE_IDENTITY();

		INSERT INTO UsuariosPreguntas (IdUsuario, IdPregunta, IdRespuesta)
		VALUES (@UserId, @pIdPregunta, @RespuestaId);

		SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosUsuario]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDatosUsuario](
@pInicio VARCHAR(255)
)
AS
BEGIN
	SELECT *
    FROM Usuarios
    WHERE Email = @pInicio OR Username = @pInicio OR Telefono = @pInicio
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPreguntaDeSeguridad]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPreguntaDeSeguridad](
@pInicio VARCHAR(255)
)
AS
BEGIN
	SELECT ps.Texto_Pregunta 
    FROM PreguntasDeSeguridad ps
    INNER JOIN UsuariosPreguntas up ON ps.IdPregunta = up.IdPregunta
    INNER JOIN Usuarios u ON u.IdUsuario = up.IdUsuario
    WHERE u.Email = @pInicio OR u.Username = @pInicio OR u.Telefono = @pInicio
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPreguntasDeSeguridad]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPreguntasDeSeguridad]
AS
BEGIN
	SELECT IdPregunta, Texto_Pregunta FROM PreguntasDeSeguridad
END;
GO
/****** Object:  StoredProcedure [dbo].[RestablecerContrasenia]    Script Date: 21/11/2024 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RestablecerContrasenia](
@pInicio VARCHAR(255),
@pRespuestaSeguridad VARCHAR(255),
@pNuevaContrasenia VARCHAR(255)
)
AS
BEGIN
	SELECT COUNT(1) 
    FROM RespuestasPreguntas rp
    INNER JOIN Usuarios u ON u.IdUsuario = rp.IdUsuario
    WHERE (u.Email = @pInicio OR u.Username = @pInicio OR Telefono = @pInicio) AND rp.Texto_Respuesta = @pRespuestaSeguridad
END;
GO
