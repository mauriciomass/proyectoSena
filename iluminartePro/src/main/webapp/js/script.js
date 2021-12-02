document.getElementById("btn__iniciar-sesion").addEventListener("click", iniciarSesion);
document.getElementById("btn__registrarse").addEventListener("click", register);
document.getElementById("btn__registrar").addEventListener("click", signup);

window.addEventListener("resize", anchoPagina);

//Declaración de variables
var contenedor_login_register = document.querySelector(".contenedor__login-register");
var formulario_login = document.querySelector(".formulario__login");
var formulario_register = document.querySelector(".formulario__register");
var caja_trasera_login = document.querySelector(".caja__trasera-login");
var caja_trasera_register = document.querySelector(".caja__trasera-register");

function anchoPagina() {
    if (window.innerWidth > 850) {
        caja_trasera_login.style.display = "block";
        caja_trasera_register.style.display = "block";
    } else {
        caja_trasera_register.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.display = "none";
        formulario_login.style.display = "block";
        formulario_register.style.display = "none";
        contenedor_login_register.style.left = "0px"
    }
}

anchoPagina();

function iniciarSesion() {
    if (window.innerWidth > 850) {
        formulario_register.style.display = "none"
        contenedor_login_register.style.left = "10px";
        formulario_login.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.opacity = "0";
    } else {
        formulario_register.style.display = "none"
        contenedor_login_register.style.left = "0px";
        formulario_login.style.display = "block";
        caja_trasera_register.style.display = "block";
        caja_trasera_login.style.display = "none";
    }
}

function signup(){
    console.log("Ingreso a registrarse")

    const form=document.getElementById("signup");


    const url='http://localhost:8081/usuario/registrar';

   const headers = {
      Accept: "application/json",
      "Content-Type": "application/json",
    };
    fetch(url, {
      method: "POST",
      headers,
      body: JSON.stringify({
        "nombreUsuario": document.forms["signup"]["name"].value,
                "apellidoUsuario": document.forms["signup"]["lastname"].value,
                "contrasenaUsuario":document.forms["signup"]["password"].value,
                "numeroIdUsuario":document.forms["signup"]["idnumber"].value,
                "direccionUsuario":document.forms["signup"]["address"].value,
                "telefonoUsuario":document.forms["signup"]["phone"].value,
                "correoUsuario":document.forms["signup"]["email"].value,
                "idTipoDocumentoFK": document.forms["signup"]["idtype"].value,
                "idRolFK": 3
      }),
    })
      .then((response) => {
        // 1. check response.ok
        if (response.status===200) {
            alert("Su usuario se registro exitosamente");
        }
        return Promise.reject(response); // 2. reject instead of throw
      })
      .then((json) => {
        // all good, token is ready
        alert("Su usuario se registro exitosamente")
      })
      .catch((response) => {
        console.log(response.status, response.statusText);
        // 3. get error messages, if any
        response.json().then((json) => {
            alert("Error al registrar su usuario")
        })
      });
  
    /*fetch('http://localhost:8081/usuario/registrar', {
            method: 'POST',
            body: JSON.stringify({
                "nombreUsuario": document.forms["signup"]["name"].value,
                "apellidoUsuario": document.forms["signup"]["lastname"].value,
                "contrasenaUsuario":document.forms["signup"]["password"].value,
                "numeroIdUsuario":document.forms["signup"]["idnumber"].value,
                "direccionUsuario":document.forms["signup"]["address"].value,
                "telefonoUsuario":document.forms["signup"]["phone"].value,
                "correoUsuario":document.forms["signup"]["email"].value,
                "idTipoDocumentoFK": document.forms["signup"]["idtype"].value,
                "idRolFK": 3
            }),
            headers: {
                "Content-type": "application/json"
            }
        })
      .then(response => {response.json()
            
        })
      .then(json => console.log(json))*/
     

}

function register() {
    if (window.innerWidth > 850) {
        formulario_register.style.display = "block"
        contenedor_login_register.style.left = "410px";
        formulario_login.style.display = "none";
        caja_trasera_register.style.opacity = "0";
        caja_trasera_login.style.opacity = "1";
    } else {
        formulario_register.style.display = "block"
        contenedor_login_register.style.left = "0px";
        formulario_login.style.display = "none";
        caja_trasera_register.style.display = "none";
        caja_trasera_login.style.display = "block";
        caja_trasera_login.style.opacity = "1";
    }




   
}