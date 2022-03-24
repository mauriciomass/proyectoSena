<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reestablecer Contraseña - Iluminarte</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos_olvido2.css">
  

</head>


<header id="header">
        <div class="container__header">
            <div class="logo">
                       <img src="img/iluminarte.png" alt="">
            </div>
          <div class="container__nav">
                <nav id="nav">               
                    <ul>
                         <li> <a href="index.jsp">Inicio</a></li>
                        <li><a href="index.jsp" class="cover">Tienda</a></li>
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
                            
                <div class="contenedor__login-register">
                    <!--Login-->
                    <form action="ForgetPasswordController?accion=" method="POST" id="olvidoContrasena" class="formulario__login">
                        <h2>Escriba su correo</h2>
                        
                        <input type="hidden" class="form-control" name="id" id="id" value="${usuaval.idUsuario}"/>
					  	<input type="hidden" class="form-control" name="nombre" id="nombre" value="${usuaval.nombreUsuario}"/>
					  	<input type="hidden" class="form-control" name="apellido" id="apellido" value="${usuaval.apellidoUsuario}"/>
                        
                        <input type="email" class="form-control"  id="correo" name="correo" placeholder=" Ingrese su correo" onchange="verifyforgpass()">
                  
                        <div id="enviarVal" class="text-danger"> </div>			            
			            <div id="correoexistVal" class="text-danger"> </div>			           
			            <div id="forgpassVal" class="text-info"> </div>
                          
    
                         <button type="submit"  class="btn btn-secondary btn-sm" name="Cancelar" id="Cancelar">Cancelar</button>
						<button type="submit" class="btn btn-success btn-sm" name="envioCorreo" id="enviar" disabled="disabled" onclick="guardar()">Enviar</button>  
                        
                </div>
            </div>

        </main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

function verifyforgpass(){
	const correo=document.getElementById("correo").value;
	
	const enviar=document.getElementById("enviar");
	console.log(correo)
	$.ajax({
		  url: "ForgetPasswordController?accion=valForgPass",
		  data: {
			  correo:correo			  
		  },
		  success: function(resultforgpass) {
			  resultforgpass= resultforgpass.split(";");
			  console.log(resultforgpass)
			  $('#enviarVal').html("");
		      $("#correoexistVal").html("");
		      $("#forgpassVal").html("");
		      
			  if (resultforgpass[0]=="false" && resultforgpass[1] =="correoforgpass"){
				  $("#enviarVal").html( "<small>" + resultforgpass[2] + "</small>" );
				  $('#enviar').attr('disabled', 'disabled');
				  
			  }
		      
			  else if (resultforgpass[0]=="false" && resultforgpass[1] =="correoexist"){				  					  
				  $('#correoexistVal').html( "<small>" + resultforgpass[2] + "</small>" );
				  $('#enviar').attr('disabled', 'disabled');

			  }
			  
			  else if (resultforgpass[0]=="true"){
				  console.log("Validado")					  
				  $('#forgpassVal').html( "<small>" + resultforgpass[1] + "</small>" );
				  $("#enviar").removeAttr("disabled");

			  }
			  
		   }
		});
	
}


</script>

<script> 

function guardar(){
	
	const enviar=document.getElementById("enviar");
	
	if (enviar!= false){
	
		Swal.fire({
		  position: 'top-end',
		  icon: 'success',
		  title: 'Iluminarte envio información a su correo',
		  showConfirmButton: false,
		  timer: 1500
		}
	})
	};
</script>
        
</body>
</html>
