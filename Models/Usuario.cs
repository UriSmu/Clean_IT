using System.Text.Json;

[Serializable]
public class Usuario
{
    public string? Email { get; set; }
    public string? Contrasenia { get; set; }

    public string Username { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Telefono { get; set; }
    public string Documento { get; set; }
    public string Foto{get;set;}
    public int IdUsuario {get; set;}

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }

    public static Usuario? FromString(string? json)
    {
        if (json is null)
        {
            return null;
        }

        return JsonSerializer.Deserialize<Usuario>(json);
    }
    public Usuario()
    {


    }
    public Usuario(string email, string contrasenia)
    {
        Email = email;
        Contrasenia = contrasenia;
    }
}
