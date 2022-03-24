<%@include file="header.jsp" %>
  <div class="mdl-tabs__tab-bar">
 
	 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
		<div class="full-width panel mdl-shadow--5dp">
			
	  
	  <h1>Registro de Categoria</h1>
	  
	  <form method="post" action="CategoriaController?accion=addCategoria">
	  
	  	<div class="form-group">
	  		<label for="nombre">Nombre de la Categoria</label>
	  		<input type="text" class="form-control" name="nombre" id="nombre" onBlur="verifyCategoria()" placeholder="Ingrese el nombre de la categoria" value="${categoria.nombreCategoria}"/>
	  		
	  		<div id="msnnombreVal" class="text-danger"> </div>
	  		
	  		<label for="descripcion">Descripción de la Categoria</label>
	  		<input type="text" class="form-control" name="descripcion" id="descripcion" onBlur="verifyCategoria()" placeholder="Ingrese la descripcion de la categoria" value="${categoria.descripcionCategoria}"/>
	  		 
	  		 
	  		 <div id="msndescripcionVal" class="text-danger"> </div>		  		
	  	</div>
	  	
	  	<div class="form-check">
	  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" checked>
	  <label class="form-check-label" for="flexCheckChecked">
	    Activo
	  </label>
	</div>
	
	<div id="formVal" class="text-success"> </div>
	
	<div>
	<button type="submit" class="btn btn-primary" id="guardarcategoria" disabled="disabled" onclick="guardar()">Guardar</button>
	</div>
	  
	  </form>
	  </div> 
	</div>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	
function verifyCategoria(){

		const guardarcategoria=document.getElementById("guardarcategoria");
		var nombre = document.getElementById("nombre").value;
		var descripcion = document.getElementById("descripcion").value;
		
		console.log(nombre)
		console.log(descripcion)
		$.ajax({
			  url: "CategoriaController?accion=validarFormulario",
			  data: {
			    nombre: nombre,
			    descripcion : descripcion
			    },
			  success: function(resultcategoria) {
				  partes= resultcategoria.split(";");
				  console.log(partes)
		  		  $("#msnnombreVal").html("");
				  $("#msndescripcionVal").html("");
				  $("#formVal").html("");

				  if (partes[0]=="false" && partes[1] =="msnnombrecat"){
						  $("#msnnombreVal").html( "<small>" + partes[2] + "</small>" );
						  $('#guardarcategoria').attr('disabled', 'disabled');
					  
					  }
				  
				  else if (partes[0]=="false" && partes[1] =="msndescripcioncat"){
					  $("#msndescripcionVal").html( "<small>" + partes[2] + "</small>" );
					  $('#guardarcategoria').attr('disabled', 'disabled');
				  
				  }	
				  
				  else if (partes[0]=="true"){
					  console.log("Validado")					  
					  $('#formVal').html( "<small>" + partes[1] + "</small>" );
					  $("#guardarcategoria").removeAttr("disabled");
				  }
				  
			   }
				      
		});
};


</script>



<%@include file="footer.jsp" %>