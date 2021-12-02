<%@include file="header.jsp" %>
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

  
  <h1>Cambiar Contraseña</h1>
  
  <form method="post" action="UsuarioController?accion=changePassword">
  	
  	<input type="hidden" class="form-control" name="id" id="id" value="${usua.idUsuario}"/>
  	<input type="hidden" class="form-control" name="passbd" id="passbd" value="${usua.contrasenaUsuario}"/>
 	

  	
  	<div class="form-group">
  		<label for="passant">Contrasena Anterior</label>
  		<input type="password" class="form-control" name="passant" id="passant" placeholder="Ingrese la contrasena Anterior" onchange="verifypass()"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="passnew">Contrasena Nueva</label>
  		<input type="password" class="form-control" name="passnew" id="passnew" placeholder="Ingrese la contrasena Nueva"/>
  	</div>
  	
  	

</div>

<div>
<button type="submit" class="btn btn-primary">Cambiar Contraseña</button>
</div>
  
  </form>
  </div> 
</div>

<script>

function verifypass(){
	const passbd=document.getElementById("passbd");
	const passant=document.getElementById("passant");
	
	if(passbd.value==passant.value){
		alert("Se ha verificado su contraseña");
	}
	else{	
		alert("Su contraseña no coincide con la registrada,intente nuevamente");
		passant.focus();
		passant.value="";
		}
	
	
}

</script>


<%@include file="footer.jsp" %>