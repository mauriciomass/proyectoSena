<%@include file="header.jsp" %>
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
	
  
  <h1>Registro de Proveedor</h1>
  
  <form method="post" action="ProveedorController?accion=addProveedor">
  
  	<div class="form-group">
  		<label for="nombre">Nombre del Proveedor</label>
  		<input type="text" class="form-control" name="nombre" id="descripcion" placeholder="Ingrese el nombre del proveedor" value="${proveedor.nombreProveedor}"/>
  		
  		<label for="direccion">Direcci�n del Proveedor</label>
  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la direccion del proveedor" value="${proveedor.direccionProveedor}"/>
  		
  		<label for="telefono">Tel�fono del Proveedor</label>
  		<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el telefono del proveedor" value="${proveedor.telefonoProveedor}"/>
  	 	
  	 	<label for="persona">Persona de Contactor</label>
  		<input type="text" class="form-control" name="persona" id="persona" placeholder="Ingrese la persona de contacto" value="${proveedor.personaContactoProveedor}"/>	
  		
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
</div>


<%@include file="footer.jsp" %>