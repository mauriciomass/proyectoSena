<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

 Object valorContra= session.getAttribute("usupass").toString();	 

%>

<%

 Object valorDias= session.getAttribute("usudias").toString();	 

%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reestablecer Contrase&#241;a</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/estilos_validation.css">
  

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

		  
		 <form method="post" action="ValidacionPasswordDosController?accion=changePasswordVP" >
		 
		      <h2>Cambiar Contrase&#241;a</h2>
		  	
			  	<input type="hidden" class="form-control" name="id" id="id" value="${usuaval.idUsuario}"/>
			  	<input type="hidden" class="form-control" name="passbdvp" id="passbdvp" value="${usuaval.contrasenaUsuario}"/>
			  	<input type="hidden" class="form-control" name="correo" id="correo" value="${usuaval.correoUsuario}"/>
			  	<input type="hidden" class="form-control" name="nombre" id="nombre" value="${usuaval.nombreUsuario}"/>
			  	<input type="hidden" class="form-control" name="apellido" id="apellido" value="${usuaval.apellidoUsuario}"/>
			  	<input type="hidden" class="form-control" name="dias" id="dias" value="<%=valorDias%>"/>
			  	
			  	<div id="diasVal" class="text-danger"> </div>
			  	
			  	<div class="form-group">
			  		<label for="nombre1">Nombre</label>
			  			<input type="text" class="form-control" name="nombre1" id="nombre1" value="${usuaval.nombreUsuario}" disabled="disabled"/>
			  	</div>
			    <div class="form-group">
			  		<label for="apellido1">Apellido</label>
			  			<input type="text" class="form-control" name="apellido1" id="apellido1" value="${usuaval.apellidoUsuario}" disabled="disabled"/>
			  	</div>
			  	
			  	<div class="form-group">
			  		<input type="hidden" class="form-control" name="passantvp" id="passantvp" value="<%=valorContra%>" onchange="verifypassvp()"/>
			  	</div>
			  	
			  	<div id="passantValvp" class="text-danger"> </div>
			  	 
			  	
			  	<div class="form-group">
			  		<label for="passnewvp">Contrase&#241;a Nueva</label>
			  		<input type="password" class="form-control" name="passnewvp" id="passnewvp" placeholder="Ingrese la contrase&#241;a Nueva" onBlur="verifypassvp()"/>
			  	</div>
			  	
			  	<div id="passnewValvp" class="text-danger"> </div>
			  	
			  	<div class="form-group">
			  		<label for="passnewrepvp">Confirmar contrase&#241;a</label>
			  		<input type="password" class="form-control" name="passnewrepvp" id="passnewrepvp" placeholder="Vuelva a Ingresar su contrase&#241;a" onBlur="verifypassvp()"/>
			  	</div>
			  	  
			  	  
			  	<div id="passnewrepVal" class="text-danger"> </div>		
				<div id="passnewrepValvp" class="text-danger"> </div>				
				<div id="passValvp" class="text-info"> </div> 
		
		
			
			<div>
				<button type="submit" class="btn btn-success btn-sm" id="guardarContrasenavp" disabled="disabled" onclick="guardar2()">Cambiar Contrase&#241;a</button>
			</div>
			
			
			
			           </form>                       
                          
                  
                </div>
            </div>

        </main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>

function verifypassvp(){
	const passantvp=document.getElementById("passantvp").value;
	const passbdvp=document.getElementById("passbdvp").value;
	const passnewvp=document.getElementById("passnewvp").value;
	const passnewrepvp=document.getElementById("passnewrepvp").value;
	const dias=document.getElementById("dias").value;
	
	
	const guardarContrasenavp=document.getElementById("guardarContrasenavp");
	console.log(passantvp)
	console.log(passbdvp)
	console.log(passnewvp)
	console.log(passnewrepvp)
	console.log(dias)
	$.ajax({
		  url: "ValidacionPasswordDosController?accion=valPassword",
		  data: {
			  passantvp:passantvp,
			  passbdvp:passbdvp,
			  passnewvp:passnewvp,
			  passnewrepvp:passnewrepvp,
			  dias:dias
		  },
		  success: function(resultpassval) {
			  resultpassval= resultpassval.split(";");
			  console.log(resultpassval)
			  $('#passValvp').html("");
		      $("#passnewValvp").html("");
		      $("#passnewrepValvp").html("");
		      $("#passnewrepVal").html("");
		      $("#diasVal").html("");
		      
			  if (resultpassval[0]=="false" && resultpassval[1] =="contrasenaval"){
				  $("#passnewrepVal").html( "<small>" + resultpassval[2] + "</small>" );
				  $('#guardarContrasena').attr('disabled', 'disabled');


				  						  
			  }
		      
			  else if (resultpassval[0]=="false" && resultpassval[1] =="passnewvp"){				  					  
				  $('#passnewValvp').html( "<small>" + resultpassval[2] + "</small>" );
				  $('#guardarContrasenavp').attr('disabled', 'disabled');

				  
			  }
			  
			  else if (resultpassval[0]=="false" && resultpassval[1] =="passnewrepvp"){				  					  
				  $('#passnewrepValvp').html( "<small>" + resultpassval[2] + "</small>" );
				  $('#guardarContrasenavp').attr('disabled', 'disabled');
			  }
			  
			  else if (resultpassval[0]=="false" && resultpassval[1] =="diasvp"){				  					  
				  $('#diasVal').html( "<small>" + resultpassval[2] + "</small>" );
				  $('#guardarContrasenavp').attr('disabled', 'disabled');
			  }
			  			  
			  else if (resultpassval[0]=="true"){
				  console.log("Validado")					  
				  $('#passValvp').html( "<small>" + resultpassval[1] + "</small>" );
				  $("#guardarContrasenavp").removeAttr("disabled");

			  }
			  
		   }
		});
	
}


</script>

<script> function guardar2(){
	
		Swal.fire({
		  position: 'top-end',
		  icon: 'success',
		  title: 'Iluminarte envio información a su correo',
		  showConfirmButton: false,
		  timer: 1500
	})
	};
</script>

        
</body>
</html>