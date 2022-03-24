<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/Estilos_role_add.css">

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--5dp">
		
		<div class="contenedor__todo">
				
				  <div class="formulario__register">
		
  
  <h1>Actualizar de Roles</h1>
  
  <form method="post" action="TipoRolController?accion=editRol">
  	
  	<input type="hidden" class="form-control" name="id" value="${tiporol.idRol}"/>
  	
  	<div class="form-group">
  		<label for="nombre">Nombre del Rol</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el nombre" onBlur="verifyRoleEdit()" value="${tiporol.nombreRol}"/>
  	</div>
  	
  	<div id="msnrolVal" class="text-danger"> </div>
  	
  	<div class="form-check">
			  	
	  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" 
	  	<c:out value="${tiporol.estadoRol==false ? 'unchecked':'checked'}" default=""/>>
		  <label class="form-check-label" for="flexCheckChecked">
			${tiporol.estadoRol==false ? 'Marca la casilla para activar':'Desmarca la casilla para Inactivar'}
		  </label>
	</div>
	
	<div id="formVal" class="text-success"> </div>

	<div class="d-flex justify-content-end">
		<button class="btn btn-secondary btn-sm" name="Cancelar" id="Cancelar">Cancelar</button>
		<button type="submit" class="btn btn-primary" id="guardarrol" disabled="disabled" onclick="guardar()">Guardar</button>
	</div>
  
  </form>
  </div> 
</div>
</div>
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

function verifyRoleEdit(){

		const guardarrol=document.getElementById("guardarrol");
		var nombre = document.getElementById("nombre").value;
		
		console.log(nombre)
		$.ajax({
			  url: "TipoRolController?accion=validarFormulario",
			  data: {
			    nombre: nombre
			    },
			  success: function(resultroledit ) {
				  partes= resultroledit.split(";");
				  console.log(partes)
		  		  $("#msnrolVal").html("");
				  $("#formVal").html("");

				  if (partes[0]=="false" && partes[1] =="msnnombrerol"){
						  $("#msnrolVal").html( "<small>" + partes[2] + "</small>" );
						  $('#guardarrol').attr('disabled', 'disabled');
					  
					  }	
				  
				  else if (partes[0]=="true"){
					  console.log("Validado")					  
					  $('#formVal').html( "<small>" + partes[1] + "</small>" );
					  $("#guardarrol").removeAttr("disabled");
				  }
				  
			   }
				      
		});
};

</script>

<%@include file="footer.jsp" %>