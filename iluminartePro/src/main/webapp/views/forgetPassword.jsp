<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reestablecer Contraseña</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>

<div class="container">

  <div class="d-flex justify-content-center align-items-center">

    <h1>Olvido su contraseña</h1>

    <div class="card" style="width: 35rem; margin: 20px auto;">    
        <div class="card-body">
				<form action="ForgetPasswordController?accion=envioCorreo" class="form-horizontal" role="form" method="POST" id="olvidoContrasena">
					
						<input type="hidden" class="form-control" name="id" id="id" value="${usuaval.idUsuario}"/>
					  	<input type="hidden" class="form-control" name="nombre" id="nombre" value="${usuaval.nombreUsuario}"/>
					  	<input type="hidden" class="form-control" name="apellido" id="apellido" value="${usuaval.apellidoUsuario}"/>
						
						<div class="mb-3">
			                <label for="correo" class="form-label">Escriba su correo</label>
			                <input type="email" class="form-control"  id="correo" name="correo" placeholder=" Ingrese su correo" onBlur="verifyforgpass()">
			            </div>
			            
			             <div id="enviarVal" class="text-danger"> </div>			            
			            <div id="correoexistVal" class="text-danger"> </div>			           
			            <div id="forgpassVal" class="text-info"> </div>
			            
			            <div class="d-flex justify-content-end">
							<button class="btn btn-secondary btn-sm" name="borrar" id="borrar">Borrar</button>
							<button type="submit" class="btn btn-success btn-sm" id="enviar" disabled="disabled" onclick="guardar()">Enviar</button>
						</div>
				</form>
        	</div>
    	</div>

	</div>
</div>

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