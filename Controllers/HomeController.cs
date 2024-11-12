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

    public IActionResult Inicio(string inicio, string pass)
    {
        Usuarios user = BD.ObtenerDatosUsuario(inicio);

        return View(user);
    }

}
