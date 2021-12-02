<%@include file="header.jsp" %>
  <!--  <div class="flex-fill flex-grow-1 ms-3">-->
 <div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--5dp">
					

  <h1>Registro de Roles</h1>
  
  <form method="post" action="TipoRolController?accion=addRol">
  	
  	<div class="form-group">
  		<label for="nombre">Nombre Rol</label>
  		<input type="text" class="form-control" name="nombre" id="descripcion" placeholder="Ingrese el nombre del rol" value="${roles.idRol}"/>
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