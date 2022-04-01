<%@include file="header.jsp" %>
<%@page session="true"%>


<div class="d-flex justify-content-center align-items-center">

	
	<div class="col-sm-3">
			
			
	 <div class="card">
				
		<div class="card-body">

  
		  <h1>Cambiar Contraseña</h1>
		  
		 <form method="post" action="UsuarioController?accion=changePassword" >
		  	
			  	<input type="hidden" class="form-control" name="id" id="id" value="${usua.idUsuario}"/>
			  	<input type="hidden" class="form-control" name="passbd" id="passbd" value="${usua.contrasenaUsuario}"/>
			  	<input type="hidden" class="form-control" name="correo" id="correo" value="${usua.correoUsuario}"/>
			  	<div class="form-group">
			  		<label for="nombre">Nombre</label>
			  			<input type="text" class="form-control" name="nombre" id="nombre" value="${usua.nombreUsuario}" disabled="disabled"/>
			  	</div>
			    <div class="form-group">
			  		<label for="apellido">Apellido</label>
			  			<input type="text" class="form-control" name="apellido" id="apellido" value="${usua.apellidoUsuario}" disabled="disabled"/>
			  	</div>
			  	
			  	<div class="form-group">
			  		<label for="passant">Contraseña Anterior</label>
			  		<input type="password" class="form-control" name="passant" id="passant" placeholder="Ingrese la contraseña Anterior" onBlur="verifypass()"/>
			  	</div>
			  	
			  	<div id="passantVal" class="text-danger"> </div>
			  	 
			  	
			  	<div class="form-group">
			  		<label for="passnew">Contraseña Nueva</label>
			  		<input type="password" class="form-control" name="passnew" id="passnew" placeholder="Ingrese la contraseña Nueva" onBlur="verifypass()"/>
			  	</div>
			  	
			  	<div id="passnewVal" class="text-danger"> </div>
			  	
			  	<div class="form-group">
			  		<label for="passnewrep">Validar Contraseña Nueva</label>
			  		<input type="password" class="form-control" name="passnewrep" id="passnewrep" placeholder="Vuelva a Ingresar su contraseña Nueva" onBlur="verifypass()"/>
			  	</div>
			  	  
			  	<div id="passnewrepVal" class="text-danger"> </div>		
				
				<div id="passVal" class="text-info"> </div> 
		
			
			<div>
				<button type="submit" class="btn btn-success btn-sm" id="guardarContrasena" disabled="disabled" onclick="guardar()">Cambiar Contraseña</button>
			</div>
			
			
			
			 </form>
				</div>
			 
			
			  </div> 
			</div>
		</div>
	 	

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>
function verifypass(){
	const passant=document.getElementById("passant").value;
	const passbd=document.getElementById("passbd").value;
	const passnew=document.getElementById("passnew").value;
	const passnewrep=document.getElementById("passnewrep").value;
	
	const guardarContrasena=document.getElementById("guardarContrasena");
	console.log(passant)
	console.log(passbd)
	console.log(passnew)
	console.log(passnewrep)
	$.ajax({
		  url: "UsuarioController?accion=changePasswordVal",
		  data: {
			  passant:passant,
			  passbd:passbd,
			  passnew:passnew,
			  passnewrep:passnewrep
		  },
		  success: function(resultpass) {
			  partespass= resultpass.split(";");
			  console.log(partespass)
	  		  $("#passantVal").html("");	
		      $("#passVal").html("");
		      $("#passnewVal").html("");
		      $("#passnewrepVal").html("");
			  if (partespass[0]=="false" && partespass[1] =="formatocontrasena"){
					  $("#passantVal").html( "<small>" + partespass[2] + "</small>" );
					  $('#guardarContrasena').attr('disabled', 'disabled');
					  						  
				  }
			  
			  else if (partespass[0]=="false" && partespass[1] =="formatopassnew"){				  					  
				  $('#passnewVal').html( "<small>" + partespass[2] + "</small>" );
				  $('#guardarContrasena').attr('disabled', 'disabled');
				  
			  }
			  
			  else if (partespass[0]=="false" && partespass[1] =="formatopassnewrep"){				  					  
				  $('#passnewrepVal').html( "<small>" + partespass[2] + "</small>" );
				  $('#guardarContrasena').attr('disabled', 'disabled');
				  
			  }
			  			  
			  else if (partespass[0]=="true"){
				  console.log("Validado")					  
				  $('#passVal').html( "<small>" + partespass[1] + "</small>" );
				  $("#guardarContrasena").removeAttr("disabled");
			  }
			  
		   }
		});
	
}
</script>


<%@include file="footer.jsp" %>