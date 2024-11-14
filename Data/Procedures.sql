CREATE PROCEDURE InsertarUsuario (
@pEmail VARCHAR(255),
@pUsuario VARCHAR(255),
@pNombre VARCHAR(255),
@pApellido VARCHAR(255),
@pTelefono VARCHAR(255),
@pDocumento VARCHAR(255),
@pContrasenia VARCHAR(255),
@pIdPregunta INT,
@pRespuestaSeguridad VARCHAR(255)
)
AS
BEGIN
	IF (SELECT COUNT(1) FROM Usuarios WHERE Email = @pEmail or Telefono = @pTelefono) = 0
	BEGIN
		DECLARE @UserId INT;
		INSERT INTO Usuarios (Username, Nombre, Apellido, Email, Telefono, Documento, Contrasenia)
		VALUES (@pUsuario, @pNombre, @pApellido, @pEmail, @pTelefono, @pDocumento, @pContrasenia);

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



ALTER PROCEDURE IniciarSesion(
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



ALTER PROCEDURE ObtenerPreguntaDeSeguridad(
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



CREATE PROCEDURE ObtenerPreguntasDeSeguridad
AS
BEGIN
	SELECT IdPregunta, Texto_Pregunta FROM PreguntasDeSeguridad
END;



ALTER PROCEDURE RestablecerContrasenia(
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



ALTER PROCEDURE ObtenerDatosUsuario(
@pInicio VARCHAR(255)
)
AS
BEGIN
	SELECT Username, Nombre, Apellido, Email, Telefono, Documento 
    FROM Usuarios
    WHERE Email = @pInicio OR Username = @pInicio OR Telefono = @pInicio
END;