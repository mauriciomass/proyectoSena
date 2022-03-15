<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

 Object valorContra= session.getAttribute("usupass").toString();	 

%>

<%

 Object valorDias= session.getAttribute("usudias").toString();	 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reestablecer Contraseña</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>


<div class="d-flex justify-content-center align-items-center">

	
	<div class="col-sm-3">
			
			
	 <div class="card">
				
		<div class="card-body">

  
		  <h1>Cambiar Contraseña</h1>
		  
		 <form method="post" action="ValidacionPasswordDosController?accion=changePasswordVP" >
		  	
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
			  		<label for="passnewvp">Contraseña Nueva</label>
			  		<input type="password" class="form-control" name="passnewvp" id="passnewvp" placeholder="Ingrese la contraseña Nueva" onchange="verifypassvp()"/>
			  	</div>
			  	
			  	<div id="passnewValvp" class="text-danger"> </div>
			  	
			  	<div class="form-group">
			  		<label for="passnewrepvp">Repita su contraseña</label>
			  		<input type="password" class="form-control" name="passnewrepvp" id="passnewrepvp" placeholder="Vuelva a Ingresar su contraseña" onchange="verifypassvp()"/>
			  	</div>
			  	  
			  	  
			  	<div id="passnewrepVal" class="text-danger"> </div>		
				<div id="passnewrepValvp" class="text-danger"> </div>				
				<div id="passValvp" class="text-info"> </div> 
		
			
			<div>
				<button type="submit" class="btn btn-success btn-sm" id="guardarContrasenavp" disabled="disabled" onclick="guardar()">Cambiar Contraseña</button>
			</div>
			
			
			
			 </form>
				</div>
			 
			
			  </div> 
			</div>
		</div>
	 	

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

<script> function guardar(){
	
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