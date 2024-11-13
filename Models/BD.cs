using System;
using System.Data.SqlClient;
using Dapper;

namespace Clean_IT.Models;

static public class BD
{
    private static string _connectionString = @"Server=PC-URI\SQLEXPRESS; DataBase=Clean IT; Trusted_Connection=True;";
                
public static int InsertarUsuario(string usuario, string nombre, string apellido, string email, string telefono, string documento, string contraseña, int idPregunta, string respuestaSeguridad)
{
    string sql = "exec InsertarUsuario @pEmail, @pUsuario, @pNombre, @pApellido, @pTelefono, @pDocumento, @pContrasenia, @pIdPregunta, @pRespuestaSeguridad";

    int resultado;
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        resultado = db.QueryFirstOrDefault<int>(sql, new {
            pUsuario = usuario,
            pNombre = nombre,
            pApellido = apellido,
            pEmail = email,
            pTelefono = telefono,
            pDocumento = documento,
            pContrasenia = contraseña,
            pIdPregunta = idPregunta,
            pRespuestaSeguridad = respuestaSeguridad
        });
    }
    return resultado;
}

    public static int IniciarSesion(string inicio, string contraseña)
    {
        string sql = "exec IniciarSesion @pInicio, @pContrasenia";

        int resultado;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.QueryFirstOrDefault<int>(sql, new{pInicio = inicio, pContrasenia = contraseña});
        }
        return resultado;
    }


    public static string ObtenerPreguntaDeSeguridad(string inicio)
    {
        string sql = "exec ObtenerPreguntaDeSeguridad @pInicio";

        string preguntaSeguridad;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            preguntaSeguridad = db.QueryFirstOrDefault<string>(sql, new { pInicio = inicio });
        }

        return preguntaSeguridad;
    }

    public static List<PreguntaSeguridad> ObtenerPreguntasDeSeguridad()
    {
        string sql = "exec ObtenerPreguntasDeSeguridad";

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<PreguntaSeguridad>(sql).ToList();
        }
    }


    public static bool RestablecerContraseña(string inicio, string respuestaSeguridad, string nuevaContraseña)
    {
        string sqlVerificarRespuesta = "exec RestablecerContrasenia @pInicio, @pRespuestaSeguridad, @pNuevaContrasenia";

        bool esRespuestaCorrecta;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            esRespuestaCorrecta = db.QueryFirstOrDefault<int>(sqlVerificarRespuesta, new
            {
                pInicio = inicio,
                pRespuestaSeguridad = respuestaSeguridad,
                pNuevaContrasenia = nuevaContraseña
            }) == 1;
        }

        if (esRespuestaCorrecta)
        {
            string sqlActualizarContraseña = @"
                UPDATE Usuarios
                SET Contrasenia = @pNuevaContrasenia
                WHERE Email = @pInicio OR Username = @pInicio";

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sqlActualizarContraseña, new
                {
                    pNuevaContrasenia = nuevaContraseña,
                    pInicio = inicio
                });
            }
            return true;
        }
        return false;
    }

    public static Usuarios ObtenerDatosUsuario(string inicio)
    {
        string sql = "exec ObtenerDatosUsuario @pInicio";

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.QueryFirstOrDefault<Usuarios>(sql, new { pInicio = inicio });
        }
    }

}
