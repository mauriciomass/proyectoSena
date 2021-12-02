<%@include file="header.jsp" %>

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

  
  <h1>Registro de Productos</h1>
  
  <form method="post" action="ProductoController?accion=add" enctype="multipart/form-data">
  	
	<div class="form-group">
  	  <label>Categoria</label>
           
                <select class="form-select" aria-label="Default select example" name="categoria">
                      <option>Seleccione la Categoria</option>
                 		<c:forEach items="${categoria}" var="categoria">
                            <option value="${categoria.idCategoria}"         
                             >${categoria.nombreCategoria}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
     <div class="form-group">
  	  <label>Proveedor</label>
           
                <select class="form-select" aria-label="Default select example" name="proveedor">
                    <option>Seleccione el proveedor</option>
                 		<c:forEach items="${proveedor}" var="proveedor">
                            <option value="${proveedor.idProveedor}"         
                             >${proveedor.nombreProveedor}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    


  	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre del Producto"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="precio">Precio</label>
  		<input type="text" class="form-control" name="precio" id="precio" placeholder="Ingrese el Precio"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="descripcion">Descripcion</label>
  		<input type="text" class="form-control" name="descripcion" id="descripcion" placeholder="Ingrese la Descripcion"/>
  	</div>
  	
  	 <div class="form-group">
  		<label for="imagen">Imagen</label>
  		<input type="file" class="form-control" name="imagen" id="imagen" placeholder="Ingrese la Imagen"/>
		
  	</div>
  	
  	<div class="form-group">
  		<label for="stock">Stock</label>
  		<input type="text" class="form-control" name="stock" id="stock" placeholder="Ingrese el stock"/>
  	</div>
  	
  	  	
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


<%@include file="footer.jsp" %>