<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es-ES">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ingreso - Registro</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="./css/estilos.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a href="index.jsp"><img class="logo" src="img/iluminarte.png" alt="logo"></a>
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id ="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contactanos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Sobre nosotros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Tienda</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<main>
<div class="contenedor__todo">

            <div class="caja__trasera">
                <div class="caja__trasera-login">
                    <h3>�Ya tienes cuenta?</h3>
                    <p>Inicia sesi�n para entrar en la p�gina</p>
                    <button id="btn__iniciar-sesion">Iniciar sesi�n</button>
                </div>
                <div class="caja__trasera-register">
                    <h3>�A�n no tienes cuenta?</h3>
                    <p>Reg�strate para que puedas iniciar sesi�n</p>
                    <button id="btn__registrarse">Reg�strarte</button>
                </div>
            </div>

            <!--Formulario de ingreso - registro-->
            <div class="contenedor__login-register">

                <!--Login-->
                <form action="UsuarioController?accion=login" class="formulario__login" method="POST">
                    <h2>Iniciar sesi�n</h2>
                    <input type="text" name="correo" placeholder="Correo electr�nico" >
                    <input type="password" name="password" placeholder="Contrase�a">
                    <button type="submit" class="btn btn-primary">Iniciar Sesi�n</button>
                    <p>
                    	<%
                    	if(request.getParameter("msn")!=null){
                    		out.println(request.getParameter("msn"));
                    	}
                    	%>
                    </p>
                </form>

                <!--Registro-->
                <form action="" class="formulario__register">
                    <h2>Reg�strate</h2>
                    <input type="text" placeholder="Nombres">
                    <input type="text" placeholder="Apellidos">
                    <input type="text" placeholder="Correo electr�nico">
                    <input type="password" placeholder="Contrase�a">
                    <input type="password" placeholder="Confirmar contrase�a">
                    <button>Reg�strarse</button>
                </form>
            </div>
        </div>

</main>
   <script src="js/login.js"></script>
</body>
</html>