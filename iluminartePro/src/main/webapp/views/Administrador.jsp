<%@include file="header.jsp" %>

 <div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
		

  <h1>Lista de Administradores</h1>
  <a type="button" class="btn btn-primary" href="ProveedorController?accion=abrirForm">
  <i class="bi bi-plus-circle"></i> 
  Agregar Proveedor
  </a>

 <table class="table table-hover table-bordered">
 
       <tr>
            <th>Id</th>
            <th>Nombre del Administrador</th>
            <th><center>Direccion</center></th>  
            <th><center>Telefono</center></th>
            <th><center>Persona de Contacto</center></th> 
            <th><center>Estado</center></th>            
            <th colspan="5"><center>Acciones</center></th>
        </tr>
        


</table>


</div>
</div>
</div> 


<%@include file="footer.jsp" %>