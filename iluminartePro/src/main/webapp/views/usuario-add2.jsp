
<%@include file="header.jsp" %>

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

  
  <h1>Registro de Usuarios</h1>
  
  <form method="post" action="UsuarioController?accion=add">
  	

	<div class="form-group">
  	  <label>Tipo Documento</label>
           
                <select class="form-select" aria-label="Default select example" name="tipodocumento">
                      <option>Seleccione el tipo de documento</option>
                 		<c:forEach items="${tip}" var="tip">
                            <option value="${tip.idTipoDocumento}"         
                             >${tip.nombreTipoDocumento}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
     <div class="form-group">
  	  <label>Rol de Usuario</label>
           
                <select class="form-select" aria-label="Default select example" name="tiporol">
                    <option>Seleccione un rol de usuario</option>
                 		<c:forEach items="${roles}" var="rol">
                            <option value="${rol.idRol}"         
                             >${rol.nombreRol}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    


  	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="apellido">Apellido</label>
  		<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese el Apellido"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="contrasena">Contrasena</label>
  		<input type="password" class="form-control" name="contrasena" id="contrasena" placeholder="Ingrese la contrasena"/>
  	</div>
  	
  	 <div class="form-group">
  		<label for="numero">No. Documento</label>
  		<input type="text" class="form-control" name="numero" id="numero" placeholder="Ingrese el No. de Documento"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="direccion">Direccion</label>
  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la Direccion"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="telefono">Telefono</label>
  		<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el Telofono"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="correo">Correo Electronico</label>
  		<input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese el Correo" onchange="verifyCorreo()"/>
  	</div>
  	<div id="mensaje" class="text-danger"> </div>
  	
  	<div class="form-check">
  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" checked>
  <label class="form-check-label" for="flexCheckChecked">
    Activo
  </label>
</div>

<div>
<button type="submit" class="btn btn-primary">Guardar</button>
</div>
  
  </form>
  </div> 
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

	
	
	

	function verifyCorreo(){
		const correo=document.getElementById("correo").value;
		console.log(correo)
		$.ajax({
			  url: "UsuarioController?accion=validarCorreo",
			  data: {
			    correo: correo
			  },
			  success: function( result ) {
			    $( "#mensaje" ).html( "<strong>" + result + "</strong>" );
			  }
			});
	}

</script>


<%@include file="footer.jsp" %>