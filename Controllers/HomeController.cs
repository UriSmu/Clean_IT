using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Clean_IT.Models;

namespace Clean_IT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Inicio()
    {
        Usuario user = Usuario.FromString(HttpContext.Session.GetString("user"));
        return View(user);
    }

    public IActionResult Contacto()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Contacto2(string nombre, string apellido, string servicio, string mensaje)
    {
        ViewBag.Nombre = nombre;
        ViewBag.Servicio = servicio;
        return View();
    }

    public IActionResult Cleaner()
    {
        return View();
    }

}
