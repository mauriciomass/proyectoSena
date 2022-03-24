<%@include file="header.jsp" %>
	<div class="mdl-tabs__tab-bar">
	 
	 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
		<div class="full-width panel mdl-shadow--5dp">
		
	  
	  <h1>Actualizar de Proveedor</h1>
	  
	  <form method="post" action="ProveedorController?accion=editProveedor">
	  	
	  	<input type="hidden" class="form-control" name="id" value="${proveedor.idProveedor}"/>
	  	
	  	<div class="form-group">
	  		<label for="nombre">Nombre del Proveedor</label>
	  		<input type="text" class="form-control" name="nombre" id="nombre" onBlur="verifyProveedorEdit()" placeholder="Ingrese el nombre del proveedor" value="${proveedor.nombreProveedor}"/>
	  	
	  		<div id="msnnombreVal" class="text-danger"> </div>
	  	
	  		<label for="direccion">Dirección del Proveedor</label>
	  		<input type="text" class="form-control" name="direccion" id="direccion" onBlur="verifyProveedorEdit()" placeholder="Ingrese la direccion del proveedor" value="${proveedor.direccionProveedor}"/>
	  		
	  		<div id="msndireccionVal" class="text-danger"> </div>
	  		
	  		<label for="telefono">Teléfono del Proveedor</label>
	  		<input type="text" class="form-control" name="telefono" id="telefono" onBlur="verifyProveedorEdit()" placeholder="Ingrese el telefono del proveedor" value="${proveedor.telefonoProveedor}"/>
	  	 	
	  	 	<div id="msntelefonoVal" class="text-danger"> </div>
	  	 	
	  	 	<label for="persona">Teléfono del Proveedor</label>
	  		<input type="text" class="form-control" name="persona" id="persona" onBlur="verifyProveedorEdit()" placeholder="Ingrese la persona de contacto" value="${proveedor.personaContactoProveedor}"/>	
	  		
	  		<div id="msnpersonaVal" class="text-danger"> </div>
	  	
	  	</div>
	  	
	  	<div class="form-check">
	  	
	  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" 
	  <c:out value="${proveedor.estadoProveedor==false ? 'unchecked':'checked'}" default=""/>>
	  <label class="form-check-label" for="flexCheckChecked">
		${proveedor.estadoProveedor==false ? 'Marca la casilla para activar':'Desmarca la casilla para Inactivar'}
	  </label>
	</div>
	
	<div id="formVal" class="text-success"> </div>
	
	<div>
	<button type="submit" class="btn btn-primary" id="guardarproveedor" disabled="disabled" onclick="guardar()">Guardar</button>
	</div>
	  
	  </form>
	  </div> 
	</div>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	
function verifyProveedorEdit(){

		const guardarproveedor=document.getElementById("guardarproveedor");
		var nombre = document.getElementById("nombre").value;
		var direccion = document.getElementById("direccion").value;
		var telefono = document.getElementById("telefono").value;
		var persona = document.getElementById("persona").value;
		
		console.log(nombre)
		console.log(direccion)
		console.log(telefono)
		console.log(persona)
		$.ajax({
			  url: "ProveedorController?accion=validarFormulario",
			  data: {
			    nombre: nombre,
			    direccion : direccion,
			    telefono : telefono,
			    persona : persona
			    },
			  success: function(resultproveedor) {
				  partes= resultproveedor.split(";");
				  console.log(partes)
		  		  $("#msnnombreVal").html("");
				  $("#msndireccionVal").html("");
				  $("#msntelefonoVal").html("");
				  $("#msnpersonaVal").html("");
				  $("#formVal").html("");

				  if (partes[0]=="false" && partes[1] =="msnnombrepro"){
						  $("#msnnombreVal").html( "<small>" + partes[2] + "</small>" );
						  $('#guardarproveedor').attr('disabled', 'disabled');
					  
					  }
				  
				  else if (partes[0]=="false" && partes[1] =="msndireccionpro"){
					  $("#msndireccionVal").html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproveedor').attr('disabled', 'disabled');
				  
				  }	
				  
				  else if (partes[0]=="false" && partes[1] =="msntelefonopro"){
					  $("#msntelefonoVal").html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproveedor').attr('disabled', 'disabled');
				  
				  }	
				  
				  else if (partes[0]=="false" && partes[1] =="msnpersonapro"){
					  $("#msnpersonaVal").html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproveedor').attr('disabled', 'disabled');
				  
				  }	
				  
				  
				  else if (partes[0]=="true"){
					  console.log("Validado")					  
					  $('#formVal').html( "<small>" + partes[1] + "</small>" );
					  $("#guardarproveedor").removeAttr("disabled");
				  }
				  
			   }
				      
		});
};


</script>


<%@include file="footer.jsp" %>