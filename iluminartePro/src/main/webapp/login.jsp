<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
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
                    <h3>¿Ya tienes cuenta?</h3>
                    <p>Inicia sesión para entrar en la página</p>
                    <button id="btn__iniciar-sesion">Iniciar sesión</button>
                </div>
                <div class="caja__trasera-register">
                    <h3>¿Aún no tienes cuenta?</h3>
                    <p>Regístrate para que puedas iniciar sesión</p>
                    <button id="btn__registrarse">Regístrarte</button>
                </div>
            </div>

            <!--Formulario de ingreso - registro-->
            <div class="contenedor__login-register">

                <!--Login-->
                <form action="UsuarioController?accion=login" class="formulario__login" method="POST">
                    <h2>Iniciar sesión</h2>
                    <input type="text" name="correo" placeholder="Correo electrónico" required pattern="([a-zA-Z0-9_\-\.]+)(@[a-zA-Z0-9_\-\.]+)"
           				title="Por favor ingrese un correo electrónico valido">
                    <input type="password" name="password" placeholder="Contraseña" required pattern="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$"
                        title="Por favor ingrese una contraseña más fuerte">
                    <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                    <p>
                    	<%
                    	if(request.getParameter("msn")!=null){
                    		out.println(request.getParameter("msn"));
                    	}
                    	%>
                    </p>
                                        
                    <div>
                                       
                    	<a href ="ForgetPasswordController?accion=abrirFormForgetPassword" role="button" style = "padding:0px 0px 0px 0px"> ¿Olvidó su contraseña? </a>
                    </div>
                </form>

                <!--Registro-->
                <form action="UsuarioController?accion=registrarUsuario" method="POST" class="formulario__register">
                    <h2>Regístrate</h2>
                    <div class="form-group">
			  	       
			                <select class="form-select" aria-label="Default select example" name="tipodocumento" id="tipodocumento" onchange="verifyRegistrarse()">
			                      <option value="0">Seleccione el tipo de documento</option>
			                            <option value="1">Cédula de ciudadania</option>
  										<option value="2">Cédula Extranjeria</option>
  										<option value="3">Nit Empresarial</option>      
			                </select>
     			    </div>
     			    
     			    
     			   <div id="msntipodocumentVal" class="text-danger"> </div>
			
			     <div class="form-group">
			  	       
			                <select class="form-select" aria-label="Default select example" name="tiporol" id="tiporol" onchange="verifyRegistrarse()">
			                    <option value="0">Seleccione un rol de usuario</option>
			                            <option value="1">Administrador</option>
  										<option value="2">Vendedor</option>
  										<option value="3">Cliente</option> 
			                    	                 
			                </select>
			                                             
			    </div>
			    
			    <div id="msntiporolVal" class="text-danger"> </div>
			    
				<div class="form-group">			  		
			  		<input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese el Correo" required pattern="([a-zA-Z0-9_\-\.]+)(@[a-zA-Z0-9_\-\.]+)" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	<div id="msncorreoVal" class="text-danger"></div>
			
			  	
			  	<div class="form-group">
			  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	
			  	<div id="msnnombreVal" class="text-danger"> </div>
			  	
			  	
			  	<div class="form-group">
			  		<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese el Apellido" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	
			  	<div id="msnapellidoVal" class="text-danger"> </div>
			  	
			  	<div class="form-group">			  		
			  		<input type="password" class="form-control" name="contrasenaNueva" id="contrasenaNueva" placeholder="Contraseña" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	
			  	<div id="passnewVal" class="text-danger"> </div>
			  	
			  	<div class="form-group">			  		
			  		<input type="password" class="form-control" name="contrasenaConfirm" id="contrasenaConfirm" placeholder="Confirmar contraseña" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	
			  	<div id="passnewrepVal" class="text-danger"> </div>
			  	
			  	 <div class="form-group">
			  		<input type="text" class="form-control" name="numero" id="numero" placeholder="Ingrese el No. de Documento" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	
			  	<div id="msnnumdocumVal" class="text-danger"> </div>
			  	  	
			  	<div class="form-group">
			  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la Direcci&#243;n" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	  	
			  	<div id="msndireccionVal" class="text-danger"> </div>
			  	
			  	<div class="form-group">
			  	<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el N&#250;mero de Contacto" onBlur="verifyRegistrarse()"/>
			  	</div>
			  	  	
			  	<div id="msncontactoVal" class="text-danger"> </div>
			  	<div id="msnformVal" class="text-success"> </div>
			  	
                    <button type="submit" class="btn btn-success btn-sm" id="registrarse" disabled="disabled" onclick="registrarse()">Regístrarse</button>

                </form>
            </div>
        </div>

</main>
<script src="js/login.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>

function verifyRegistrarse(){
	const correo=document.getElementById("correo").value;
	const guardarUsuario=document.getElementById("registrarse");
	const nombre=document.getElementById("nombre").value;
	const apellido=document.getElementById("apellido").value;
	const contrasenaNueva=document.getElementById("contrasenaNueva").value;
	const contrasenaConfirm=document.getElementById("contrasenaConfirm").value;
	const numero=document.getElementById("numero").value;
	const direccion=document.getElementById("direccion").value;
	const telefono=document.getElementById("telefono").value;
	
	
	var listatd = document.getElementById("tipodocumento");
	
	var indicetd = listatd.selectedIndex;
	
	var opciontd = listatd.options[indicetd];
	
	var valortip = opciontd.value;
	
	var listatr = document.getElementById("tiporol");
	
	var indicetr = listatr.selectedIndex;
	
	var opciontr = listatr.options[indicetr];
	
	var valorrol = opciontr.value;
	
	console.log(correo)
	console.log(nombre)
	console.log(apellido)
	console.log(contrasenaNueva)
	console.log(contrasenaConfirm)
	console.log(numero)
	console.log(direccion)
	console.log(telefono)
	console.log(valortip)
	console.log(valorrol)
	$.ajax({
		  url: "UsuarioController?accion=registrarse",
		  data: {
		    correo: correo,
		    nombre: nombre,
		    apellido: apellido,
		    contrasenaNueva:contrasenaNueva,
		    contrasenaConfirm:contrasenaConfirm,
		    numero:numero,
		    direccion: direccion,
		    telefono: telefono,
		    tipodocumento:valortip,
		    tiporol: valorrol
		  },
		  success: function(resultregistrarse ) {
			  resultregistrar= resultregistrarse.split(";");
			  console.log(resultregistrar)
			  $("#msnformVal").html("");
	  		  $("#msncorreoVal").html("");
			  $('#msnnombreVal').html("");		      
		      $("#msnapellidoVal").html("");
		      $('#passnewVal').html("");
		      $('#passnewrepVal').html("");
		      $("#msnnumdocumVal").html("");
		      $("#msndireccionVal").html("");
		      $("#msncontactoVal").html("");
		      $("#msntipodocumentVal").html("");
		      $("#msntiporolVal").html("");
			  if (resultregistrar[0]=="false" && resultregistrar[1] =="msntipodocument"){
				  $("#msntipodocumentVal").html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
			
				  						  
			  }	
		      
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msntiporol"){
				  $("#msntiporolVal").html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
			
				  						  
			  }	
		      
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msncorreo"){
					  $("#msncorreoVal").html( "<small>" + resultregistrar[2] + "</small>" );
					  $('#registrarse').attr('disabled', 'disabled');
				
					  						  
				  }				  

			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msncorreocant"){					      
				  $('#msncorreoVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');

				  
			  }
			  
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msnnombre"){					      
				  $('#msnnombreVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
				  
			  }
			  
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msnapellido"){					      
					  $('#msnapellidoVal').html( "<small>" + resultregistrar[2] + "</small>" );
					  $('#registrarse').attr('disabled', 'disabled');
				  }
			  
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msnpassnew"){					      
				  $('#passnewVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');

				
				  
			  }
			  
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msnpassnewrep"){					      
				  $('#passnewrepVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
				
			  } 
			  
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msnnumdocum"){					      
				  $('#msnnumdocumVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
				  
			  }
			  
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msndireccion"){					      
				  $('#msndireccionVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
			  }
			  else if (resultregistrar[0]=="false" && resultregistrar[1] =="msncontacto"){					      
				  $('#msncontactoVal').html( "<small>" + resultregistrar[2] + "</small>" );
				  $('#registrarse').attr('disabled', 'disabled');
			  }
			  			  
			  else if (resultregistrar[0]=="true"){
				  console.log("Validado")					  
				  $('#msnformVal').html( "<small>" + resultregistrar[1] + "</small>" );
				  $("#registrarse").removeAttr("disabled");
		  		  
			  }
			  
		   }
			      
	});
};


</script>

</body>
</html>