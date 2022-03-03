<%@include file="header.jsp" %>
<%@page session="true"%>

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

  
  <h1>Cambiar Contraseña</h1>
  
 <form method="post" action="UsuarioController?accion=changePassword" >
  	
	  	<input type="hidden" class="form-control" name="id" id="id" value="${usua.idUsuario}"/>
	  	<input type="hidden" class="form-control" name="passbd" id="passbd" value="${usua.contrasenaUsuario}"/>
	  	<input type="hidden" class="form-control" name="correo" id="correo" value="${usua.correoUsuario}"/>
	  	<input type="hidden" class="form-control" name="nombre" id="nombre" value="${usua.nombreUsuario}"/>
	  	<input type="hidden" class="form-control" name="apellido" id="apellido" value="${usua.apellidoUsuario}"/>
	  	
	  	
	  	<div class="form-group">
	  		<label for="passant">Contrasena Anterior</label>
	  		<input type="password" class="form-control" name="passant" id="passant" placeholder="Ingrese la contrasena Anterior" onchange="verifypass()"/>
	  	</div>
	  	
	  	<div id="passantVal" class="text-danger"> </div>
	  	
	  	 
	  	 
	  	
	  	<div class="form-group">
	  		<label for="passnew">Contrasena Nueva</label>
	  		<input type="password" class="form-control" name="passnew" id="passnew" placeholder="Ingrese la contrasena Nueva" onchange="verifypass()"/>
	  	</div>
	  	  		
		<div id="passnewVal" class="text-danger"> </div>
		<div id="passVal" class="text-danger"> </div> 

	
	<div>
		<button type="submit" class="btn btn-success btn-sm" id="guardarContrasena" disabled="disabled">Cambiar Contraseña</button>
	</div>
	
	
	
 </form>
	</div>
 

  </div> 
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>

function verifypass(){
	const passant=document.getElementById("passant").value;
	const passbd=document.getElementById("passbd").value;
	const passnew=document.getElementById("passnew").value;	
	const guardarContrasena=document.getElementById("guardarContrasena");
	console.log(passant)
	console.log(passbd)
	console.log(passnew)
	$.ajax({
		  url: "UsuarioController?accion=changePasswordVal",
		  data: {
			  passant:passant,
			  passbd:passbd,
			  passnew:passnew
		  },
		  success: function(resultpass) {
			  partespass= resultpass.split(";");
			  console.log(partespass)
	  		  $("#passantVal").html("");	
		      $("#passVal").html("");
		      $("#passnewVal").html("");
			  if (partespass[0]=="false" && partespass[1] =="formatocontrasena"){
					  $("#passantVal").html( "<strong>" + partespass[2] + "</strong>" );
					  $('#guardarContrasena').attr('disabled', 'disabled');
					  						  
				  }
			  
			  else if (partespass[0]=="false" && partespass[1] =="formatopassnew"){				  					  
				  $('#passnewVal').html( "<small>" + partespass[2] + "</small>" );
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