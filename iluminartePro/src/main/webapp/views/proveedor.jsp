<%@include file="header.jsp" %>

 <div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
		

  <h1>Lista de Proveedores</h1>
  <a type="button" class="btn btn-primary" href="ProveedorController?accion=abrirForm">
  <i class="bi bi-plus-circle"></i> 
  Agregar Proveedor
  </a>

 <table class="table table-hover table-bordered" id ="datat">
 <thead>
       <tr>
            <th>Id</th>
            <th>Nombre del Proveedor</th>
            <th><center>Direccion</center></th>  
            <th><center>Telefono</center></th>
            <th><center>Persona de Contacto</center></th> 
            <th><center>Estado</center></th>            
            <th colspan="2"><center>Acciones</center></th>
        </tr>
 </thead>
 <tbody>      
<c:forEach var="proveedor" items="${proveedores}">         
        
        <tr>
        <td>${proveedor.getIdProveedor()}</td>
        <td>${proveedor.getNombreProveedor()}</td>
     	<td>${proveedor.getDireccionProveedor()}</td>
     	<td>${proveedor.getTelefonoProveedor()}</td>
     	<td>${proveedor.getPersonaContactoProveedor()}</td>
     	
     	<c:if test="${proveedor.getEstadoProveedor() == true}">
           <td><span class="badge bg-success active">Proveedor Activo</span></td> 
        </c:if>
        <c:if test="${proveedor.getEstadoProveedor() == false}">
            <td><span class="badge bg-danger active">Proveedor Inactivo</span></td> 
        </c:if>
     	
    	<td>
        <c:if test="${proveedor.getEstadoProveedor() == true}">
           <a rol="button" 
           class="btn btn-danger btn-sm" 
           onclick="cambiare(event,${proveedor.getIdProveedor()},${proveedor.getEstadoProveedor()},'Proveedor')"> 
        Inactivar
        </a>
        </c:if>
        <c:if test="${proveedor.getEstadoProveedor() == false}">
            <a rol="button" 
            class="btn btn-success btn-sm" 
            onclick="cambiare(event,${proveedor.getIdProveedor()},${proveedor.getEstadoProveedor()},'Proveedor')">
        Activar
        </a>
        </c:if> 
        </td>
      
        
        <td>
        <a rol="button" 
        class="btn btn-warning" 
        href="ProveedorController?accion=verProveedor&id=${proveedor.getIdProveedor()}">
        <i class="bi bi-pencil"></i> 
        </a>

	    <a rol="button" 
	    class="btn btn-danger" 
	    onclick="borrar(event,${proveedor.getIdProveedor()},'Proveedor')">
	    <i class="bi bi-trash"></i> 
	    </a>
	    
	    </td>
        <tr>
        
</c:forEach>    

</tbody>
</table>


</div>
</div>
</div> 


<%@include file="footer.jsp" %>