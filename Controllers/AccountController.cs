using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Clean_IT.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Hosting;
namespace Clean_IT.Controllers;

public class AccountController : Controller
{
    private IWebHostEnvironment Environment;

    public AccountController(IWebHostEnvironment environment)
    {
        Environment = environment;
    }


    [HttpGet]
    public IActionResult Registrar()
    {
        List<PreguntaSeguridad> preguntas = BD.ObtenerPreguntasDeSeguridad();
        ViewBag.PreguntasSeguridad = preguntas;
        return View();
    }

    [HttpPost]
    public IActionResult Registrar(Usuario user, IFormFile foto, int idPregunta, string respuestaSeguridad)
    {
        if (foto != null)
        {
            if (foto.Length > 0)
            {
                user.Foto = foto.FileName;
                string Ubicacion = this.Environment.ContentRootPath + @"\wwwroot\imgUsers\" + foto.FileName;
                using (var stream = System.IO.File.Create(Ubicacion))
                {
                    foto.CopyToAsync(stream);
                }

            }

        }

        int resultado = BD.InsertarUsuario(user, idPregunta, respuestaSeguridad);

        if (resultado == 1)
        {
            ViewBag.MensajeExito = "Registro exitoso. Ahora puedes iniciar sesión.";
            return RedirectToAction("IniciarSesion");
        }
        else
        {
            ViewBag.MensajeError = "El correo electrónico ya está registrado.";
            List<PreguntaSeguridad> preguntas = BD.ObtenerPreguntasDeSeguridad();
            ViewBag.PreguntasSeguridad = preguntas;
            return View();
        }
    }

    [HttpGet]
    public IActionResult IniciarSesion()
    {
        return View();
    }

    [HttpPost]
    public IActionResult IniciarSesion(string inicio, string contraseña)
    {
        int resultado = BD.IniciarSesion(inicio, contraseña);

        if (resultado == 1)
        {
            Usuario user = BD.ObtenerDatosUsuario(inicio);
            HttpContext.Session.SetString("user", user.ToString());
            return RedirectToAction("Inicio", "Home");
        }
        else
        {
            ViewBag.MensajeError = "Credenciales incorrectas.";
            return View();
        }
    }

    [HttpGet]
    public IActionResult OlvideMiContraseña()
    {
        return View();
    }

    [HttpPost]
    public IActionResult OlvideMiContraseña(string inicio)
    {
        string preguntaSeguridad = BD.ObtenerPreguntaDeSeguridad(inicio);

        if (preguntaSeguridad != null)
        {
            ViewBag.PreguntaSeguridad = preguntaSeguridad;
            ViewBag.Inicio = inicio;
            return RedirectToAction("ResponderPreguntaSeguridad", new { inicio = inicio, pregunta = preguntaSeguridad });
        }
        else
        {
            ViewBag.MensajeError = "No se encontró un usuario con esas credenciales.";
            return View();
        }
    }

    [HttpGet]
    public IActionResult ResponderPreguntaSeguridad(string inicio, string pregunta)
    {
        ViewBag.PreguntaSeguridad = pregunta;
        ViewBag.Inicio = inicio;
        return View();
    }

    [HttpPost]
    public IActionResult ResponderPreguntaSeguridad(string inicio, string respuestaSeguridad, string nuevaContraseña)
    {
        bool resultado = BD.RestablecerContraseña(inicio, respuestaSeguridad, nuevaContraseña);

        if (resultado)
        {
            ViewBag.MensajeExito = "Contraseña restablecida con éxito.";
            return RedirectToAction("IniciarSesion");
        }
        else
        {
            ViewBag.MensajeError = "La respuesta de seguridad es incorrecta.";
            return View();
        }
    }
}