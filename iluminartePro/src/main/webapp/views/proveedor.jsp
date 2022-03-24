<%@include file="header.jsp" %>

 <div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
		


  <h1><small>Lista de Proveedores</small></h1>
  
  <a type="button" class="btn btn-primary" href="ProveedorController?accion=abrirForm">
  <i class="bi bi-plus-circle"></i> 
  Agregar Proveedor
  </a>

 <table class="table table-hover table-bordered" id ="datat">
 <thead>
       <tr>
            <th><center>Id</center></th>  
           <th><center>Nombre del Proveedor</center></th>  
            <th><center>Direccion</center></th>  
            <th><center>Telefono</center></th>
            <th><center>Persona de Contacto</center></th> 
            <th><center>Estado</center></th>            
            <th colspan="3"><center>Acciones</center></th>
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
           <td> <i class="bi bi-file-person text-success text-center"  style="font-size:30px"  ></i></td> 
        </c:if>
        <c:if test="${proveedor.getEstadoProveedor() == false}">
            <td><i class="bi bi-file-person-fill text-danger"  style="font-size:30px" ></i></td> 
        </c:if>
     	
     	       
        
        
    	<td>
        <c:if test="${proveedor.getEstadoProveedor() == true}">
           <a rol="button"           
           onclick="cambiare(event,${proveedor.getIdProveedor()},${proveedor.getEstadoProveedor()},'Proveedor')"> 
         <i class="bi bi-toggle-on text-success"  style="font-size:25px"></i>
        </a>
        </c:if>
        <c:if test="${proveedor.getEstadoProveedor() == false}">
            <a rol="button" 
             onclick="cambiare(event,${proveedor.getIdProveedor()},${proveedor.getEstadoProveedor()},'Proveedor')">
             <i class="bi bi-toggle-off text-danger" style="font-size:25px"></i>
        </a>
        </c:if> 
        </td>
      
        
        <td>
        <a rol="button"         
        href="ProveedorController?accion=verProveedor&id=${proveedor.getIdProveedor()}">
        <i class="bi bi-pencil text-warning" style="font-size:25px"></i> 
        </a>
        </td>
        <td>
	    <a rol="button" 	
	    onclick="borrar(event,${proveedor.getIdProveedor()},'Proveedor')">
	   	<i class="bi bi-trash text-info"  style="font-size:25px" ></i> 
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