<%@include file="header.jsp" %>
  <div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
		
  
  <h1>Registro de Categoria</h1>
  
  <form method="post" action="CategoriaController?accion=addCategoria">
  
  	<div class="form-group">
  		<label for="nombre">Nombre de la Categoria</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el nombre de la categoria" value="${categoria.nombreCategoria}"/>
  		
  		<label for="descripcion">Descripción de la Categoria</label>
  		<input type="text" class="form-control" name="descripcion" id="descripcion" placeholder="Ingrese la descripcion de la categoria" value="${categoria.descripcionCategoria}"/>
  		  		  		
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