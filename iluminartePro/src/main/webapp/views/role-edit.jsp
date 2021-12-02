<%@include file="header.jsp" %>
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--5dp">
		
  
  <h1>Actualizar de Roles</h1>
  
  <form method="post" action="TipoRolController?accion=editRol">
  	
  	<input type="hidden" class="form-control" name="id" value="${tiporol.idRol}"/>
  	
  	<div class="form-group">
  		<label for="nombre">Nombre del Rol</label>
  		<input type="text" class="form-control" name="nombre" id="descripcion" placeholder="Ingrese el nombre" value="${tiporol.nombreRol}"/>
  	</div>
  	
  	<div class="form-check">
  	
  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" 
  <c:out value="${tiporol.estadoRol==false ? 'unchecked':'checked'}" default=""/>>
  <label class="form-check-label" for="flexCheckChecked">
	${tiporol.estadoRol==false ? 'Marca la casilla para activar':'Desmarca la casilla para Inactivar'}
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