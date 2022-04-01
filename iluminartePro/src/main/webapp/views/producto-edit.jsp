<%@include file="header.jsp" %>
<link rel="stylesheet" href="css/Estilos_pro_add.css">
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
	
<div class="contenedor__todo">
				
				  <div class="formulario__register">
  
  
  <h1>Registro de Productos</h1>
  
  <form method="post" action="ProductoController?accion=edit" enctype="multipart/form-data">
  	
  	<input type="hidden" class="form-control" name="id" value="${producto.idProducto}"/>
 	
  	<div class="form-group">
  	  <label>Producto</label>
           
                <select class="form-select" name="categoria" id="categoria" onchange="verifyProductoEdit()">
                      
                 		<c:forEach items="${categoria}" var="categoria">
                            <option value="${categoria.idCategoria}" 
                             <c:if test="${categoria.idCategoria == producto.idCategoriaFK.idCategoria}">
                                   selected
                             </c:if>         
                             >${categoria.nombreCategoria}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
    <div id="msncategoriaVal" class="text-danger"> </div>
    
     <div class="form-group">
  	  <label>Proveedor</label>
           
                <select class="form-select" name="proveedor" id="proveedor" onchange="verifyProductoEdit()">
                       <c:forEach items="${proveedor}" var="proveedor">
                            <option value="${proveedor.idProveedor}" 
                            <c:if test="${proveedor.idProveedor == producto.idProveedorFK.idProveedor}">
                                   selected
                             </c:if>          
                             >${proveedor.nombreProveedor}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
	<div id="msnproveedorVal" class="text-danger"> </div>

  	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" onBlur="verifyProductoEdit()" placeholder="Ingrese el Nombre del Producto" value="${producto.nombreProducto}"/>
  	</div>
  	
  	<div id="msnnombreVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="precio">Precio</label>
  		<input type="number" class="form-control" name="precio" id="precio" onBlur="verifyProductoEdit()" min="1" pattern="^[0-9]+" onpaste="return false;" onDrop="return false;" autocomplete=off placeholder="Ingrese el Precio" value="${producto.precioProducto}"/>
  	</div>
  	
  	<div id="msnprecioproVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="descripcion">Descripción</label>
  		<input type="text" class="form-control" name="descripcion" id="descripcion" onBlur="verifyProductoEdit()" placeholder="Ingrese la Descripción" value="${producto.descripcionProducto}"/>
  	</div>
  	
  	<div id="msndescripcionVal" class="text-danger"> </div>
  	
  	 <div class="form-group">
  		<label for="imagen">Imagen</label>
  		<input type="file" class="form-control" name="imagen" id="imagen" onBlur="verifyProductoEdit()" placeholder="Ingrese la Imagen" value="${producto.imagenProducto}"/>
  	</div>

	<div id="msnimagenVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="stock">Stock</label>
  		<input type="number" class="form-control" name="stock" id="stock" onBlur="verifyProductoEdit()" min="1" pattern="^[0-9]+" onpaste="return false;" onDrop="return false;" autocomplete=off placeholder="Ingrese el stock" value="${producto.stockProducto}"/>  		
  	</div>
  	
  	<div id="msnstockVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="codProducto">Código Producto</label>
  		<input type="text" class="form-control" name="codProducto" id="codProducto" onBlur="verifyProductoEdit()" placeholder="Ingrese el codigo del producto" value="${producto.codProducto}"/>  		
  	</div>
  	
  	<div id="msncodproVal" class="text-danger"> </div>
  	
  	<div class="form-check">
  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" checked>
  <label class="form-check-label" for="flexCheckChecked">
    Activo
  </label>
</div>

<div id="formVal" class="text-success"> </div>	

<div class="d-flex justify-content-end">
<button class="btn btn-secondary btn-sm" name="Cancelar" id="Cancelar">Cancelar</button>
<button type="submit" class="btn btn-primary" id="guardarproducto" disabled="disabled" onclick="guardar()">Guardar</button>
</div>
  
  </form>
  </div> 
</div>
</div> 
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	
function verifyProductoEdit(){
	
		var listatd = document.getElementById("categoria");
		
		var indicetd = listatd.selectedIndex;
		
		var opciontd = listatd.options[indicetd];
		
		var valortd = opciontd.value;
		
		var listatr = document.getElementById("proveedor");
		
		var indicetr = listatr.selectedIndex;
		
		var opciontr = listatr.options[indicetr];
		
		var valortr = opciontr.value;
	
		const nombre=document.getElementById("nombre").value;		
		const precio=document.getElementById("precio").value;
		const descripcion=document.getElementById("descripcion").value;
		const imagen=document.getElementById("imagen").value;
		const stock=document.getElementById("stock").value;
		const codProducto=document.getElementById("codProducto").value;
		
		const guardarproducto=document.getElementById("guardarproducto");

		
		console.log(valortd)
		console.log(valortr)
		console.log(nombre)
		console.log(precio)
		console.log(descripcion)
		console.log(imagen)
		console.log(stock)
		console.log(codProducto)
		$.ajax({
			  url: "ProductoController?accion=validarFormularioPro",
			  data: {
				categoria: valortd,
				proveedor: valortr,
				nombre: nombre,
				precio: precio,
				descripcion: descripcion,
				imagen: imagen,
				stock: stock,
				codProducto: codProducto
			  },
			  success: function(resultproductoedit) {
				  partes= resultproductoedit.split(";");
				  console.log(partes)
		  		  $("#msncategoriaVal").html("");	
			      $("#msnproveedorVal").html("");
			      $("#msnnombreVal").html("");
			      $("#msnprecioproVal").html("");
			      $("#msndescripcionVal").html("");
			      $("#msnimagenVal").html("");
			      $("#msnstockVal").html("");
			      $("#msncodproVal").html("");
			      $("#formVal").html("");
			      
				  if (partes[0]=="false" && partes[1] =="msncategoriapro"){
						  $("#msncategoriaVal").html( "<small>" + partes[2] + "</small>" );
						  $('#guardarproducto').attr('disabled', 'disabled');
	  						  
					  }				  

				 else if (partes[0]=="false" && partes[1] =="msnproveedorpro"){					      
					  $('#msnproveedorVal').html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproducto').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="msnnombrepro"){					      
					  $('#msnnombreVal').html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproducto').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="msnpreciopro"){					      
						  $('#msnprecioproVal').html( "<small>" + partes[2] + "</small>" );
						  $('#guardarproducto').attr('disabled', 'disabled');
  
					  }
				  
				  else if (partes[0]=="false" && partes[1] =="msndescripcionpro"){					      
					  $('#msndescripcionVal').html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproducto').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="msnimagenpro"){					      
					  $('#msnimagenVal').html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproducto').attr('disabled', 'disabled');
					
				  } 
				  
				  else if (partes[0]=="false" && partes[1] =="msnstockpro"){					      
					  $('#msnstockVal').html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproducto').attr('disabled', 'disabled');
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="msncodpro"){					      
					  $('#msncodproVal').html( "<small>" + partes[2] + "</small>" );
					  $('#guardarproducto').attr('disabled', 'disabled');
					  
				  }
				  			  
				  else if (partes[0]=="true"){
					  console.log("Validado")					  
					  $('#formVal').html( "<small>" + partes[1] + "</small>" );
					  $("#guardarproducto").removeAttr("disabled");

				      
				  }
				  
			   }
				      
		});
};

</script>

<%@include file="footer.jsp" %>