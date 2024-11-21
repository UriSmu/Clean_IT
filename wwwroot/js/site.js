document.addEventListener("DOMContentLoaded", function () {
    const registroForm = document.getElementById("registroForm");
    const restablecerForm = document.getElementById("restablecerForm");

    function validarContraseña(event, contraseñaId, confirmarContraseñaId) {
        const contraseña = document.getElementById(contraseñaId).value;
        const confirmarContraseña = document.getElementById(confirmarContraseñaId).value;
        const regex = /^(?=.*[!@#$%^&*])(?=.*[A-Z]).{8,}$/;

        if (!regex.test(contraseña)) {
            alert("La contraseña debe tener al menos un carácter especial, una letra en mayúscula y al menos 8 caracteres.");
            event.preventDefault();
        } else if (contraseña !== confirmarContraseña) {
            alert("Las contraseñas no coinciden.");
            event.preventDefault();
        }
    }

    if (registroForm) {
        registroForm.addEventListener("submit", function (event) {
            validarContraseña(event, "contraseña", "confirmarContraseña");
        });
    }

    if (restablecerForm) {
        restablecerForm.addEventListener("submit", function (event) {
            validarContraseña(event, "nuevaContraseña", "confirmarNuevaContraseña");
        });
    }
});


function guardarEnStorage() {
    var nombre = document.getElementById("nombre").value;
    localStorage.setItem("nombre", nombre);
  }