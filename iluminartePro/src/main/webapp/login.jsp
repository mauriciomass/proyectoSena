<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login y Register - Iluminarte</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="css/estilos_loguin2.css">
  

</head>



<header id="header">
        <div class="container__header">
            <div class="logo">
                       <img src="img/iluminarte.png" alt="">
            </div>
          <div class="container__nav">
                <nav id="nav">               
                    <ul>
                          <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="index.jsp" class="cover2">Tienda</a></li>
                        <li><a href="#">Nuestros proyectos</a></li>                 
                    </ul>
                </nav>

                
                <div class="btn__menu" id="btn_menu"><i class="fas fa-bars"></i></div>

            </div>

        </div>
    </header>


<body>

        <main>

            <div class="contenedor__todo">
                <div class="caja__trasera">
                    <div class="caja__trasera-login">
                        <h3>¿Ya tienes una cuenta?</h3>
                        <p>Inicia sesión para entrar en la página</p>
                        <button id="btn__iniciar-sesion">Iniciar Sesión</button>
                    </div>
                    <div class="caja__trasera-register">
                        <h3>¿Aún no tienes una cuenta?</h3>
                        <p>Regístrate para que puedas iniciar sesión</p>
                        <button id="btn__registrarse">Regístrarse</button>
                    </div>
                </div>

                <!--Formulario de Login y registro-->
                <div class="contenedor__login-register">
                    <!--Login-->
                    <form action="UsuarioController?accion=login" method="POST" class="formulario__login">
                        <h2>Iniciar Sesión</h2>
                        <input type="email" name="correo" placeholder="Correo electrónico" required pattern="([a-zA-Z0-9_\-\.]+)(@[a-zA-Z0-9_\-\.]+)"
           				title="Por favor ingrese un correo electrónico valido">
                        <input type="password" name="password" placeholder="Contraseña" required pattern="^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$"
                        title="Por favor ingrese una contraseña más segura">
                  
                                                                     
                        <button type="submit">Entrar</button>
                        
                      <p>
                    	<%
                    	if(request.getParameter("msn")!=null){
                    		out.println(request.getParameter("msn"));
                    	}
                    	%>
                     </p>
                        
                        
                         <div class="olvido">                                 
                       <ul>
                       <li><a href = "ForgetPasswordController?accion=abrirFormForgetPassword" role="button" > ¿Olvidó su contraseña? </a></li>                   
                       </ul>              
                       </div>
                    
                    </form>

                    <!--Register-->
                    <form action="UsuarioController?accion=registrarUsuario" method="POST" class="formulario__register">
                        <h2>Regístrarse</h2>
                        <select name="tipodocumento" id="tipodocumento" onchange="verifyRegistrarse()">
			                      <option value="0">Seleccione el tipo de documento</option>
			                            <option value="1">Cédula de ciudadania</option>
  										<option value="2">Cédula Extranjeria</option>
  										<option value="3">Nit Empresarial</option>      
			                </select>
     			    
     			    
     			    
     			   <div id="msntipodocumentVal" class="text-danger"> </div>
			
			     <div class="form-group">	
			  	       
			                <select name="tiporol" id="tiporol" onchange="verifyRegistrarse()">
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
				                    
                      </div>
                    </form>
                </div>
            </div>

        </main>

<script src="assets/js/script_loguin.js"></script>
  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>      
        
<script> 
   
   
//Ejecutando funciones
document.getElementById("btn__iniciar-sesion").addEventListener("click", iniciarSesion);
document.getElementById("btn__registrarse").addEventListener("click", register);
window.addEventListener("resize", anchoPage);

//Declarando variables
var formulario_login = document.querySelector(".formulario__login");
var formulario_register = document.querySelector(".formulario__register");
var contenedor_login_register = document.querySelector(".contenedor__login-register");
var caja_trasera_login = document.querySelector(".caja__trasera-login");
var caja_trasera_register = document.querySelector(".caja__trasera-register");

    //FUNCIONES

function anchoPage(){

    if (window.innerWidth > 850){
        caja_trasera_register.style.display = "block";
        caja_trasera_login.style.display = "block";
    }else{
        caja_trasera_register.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.display = "none";
        formulario_login.style.display = "block";
        contenedor_login_register.style.left = "0px";
        formulario_register.style.display = "none";   
    }
}

anchoPage();


    function iniciarSesion(){
        if (window.innerWidth > 850){
            formulario_login.style.display = "block";
            contenedor_login_register.style.left = "10px";
            formulario_register.style.display = "none";
            caja_trasera_register.style.opacity = "1";
            caja_trasera_login.style.opacity = "0";
        }else{
            formulario_login.style.display = "block";
            contenedor_login_register.style.left = "0px";
            formulario_register.style.display = "none";
            caja_trasera_register.style.display = "block";
            caja_trasera_login.style.display = "none";
        }
    };

    function register(){
        if (window.innerWidth > 850){
            formulario_register.style.display = "block";
            contenedor_login_register.style.left = "410px";
            formulario_login.style.display = "none";
            caja_trasera_register.style.opacity = "0";
            caja_trasera_login.style.opacity = "1";
        }else{
            formulario_register.style.display = "block";
            contenedor_login_register.style.left = "0px";
            formulario_login.style.display = "none";
            caja_trasera_register.style.display = "none";
            caja_trasera_login.style.display = "block";
            caja_trasera_login.style.opacity = "1";
        }
};
    
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

