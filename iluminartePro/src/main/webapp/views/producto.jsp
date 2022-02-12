<%@include file="header.jsp" %>
<!--  <div class="flex-fill flex-grow-1 ms-3 overflow-hidden">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
<div class="full-width panel mdl-shadow--5dp"> 

<h1>Lista de Productos</h1>
  <a type="button" class="btn btn-primary" href="ProductoController?accion=abrirForm">
  <i class="bi bi-plus-circle"></i> 
  Agregar Producto
  </a>
<div class="table-responsive">
 <table class="table table-hover table-bordered" id ="datat">
 
 <thead>
       <tr>
            <th>Id</th>
            <th>Categoria </th>
            <th>Proveedor </th>
            <th>Nombre <br>Producto</th>
            <th>Precio <br>Producto</th>
            <th>Descripcion</th>
            <th>Imagen</th>
             <th>Stock</th>
             <th>Cod</th>                            
            <th><center>Estado</center></th>                        
            <th colspan="2"><center>Acciones</center></th>
            
       </tr>
        
 </thead>

<tbody>
<c:forEach var="p" items="${producto}">         
        
        <tr>
        <td>${p.getIdProducto()}</td>
        <td>${p.idCategoriaFK.nombreCategoria}</td>
        <td>${p.idProveedorFK.nombreProveedor}</td>
        <td>${p.getNombreProducto()}</td>
        <td>${p.getPrecioProducto()}</td>        
        <td>${p.getDescripcionProducto()}</td>
        <td>
        	    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#modal${p.getIdProducto()}">
                     Ver
                 </button>
                 
                 <!-- Modal -->
                    <div class="modal fade" id="modal${p.getIdProducto()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header bg-dark">
                            <h5 class="modal-title text-white" id="exampleModalLabel">${p.getNombreProducto()}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <img src='${p.getImagenProducto("")}'/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>                            
                        </div>
                        </div>
                    </div>
                    </div>
        
        </td>
         
        <td>${p.getStockProducto()}</td>
        
        <td>${p.getCodProducto()}</td>  
          
        <c:if test="${p.isEstadoProducto() == true}">
           <td><span class="badge bg-success active">Producto Activo</span></td> 
        </c:if>
        <c:if test="${p.isEstadoProducto() == false}">
            <td><span class="badge bg-danger active">Producto Inactivo</span></td> 
        </c:if>
        
        <td>
        <c:if test="${p.isEstadoProducto() == true}">
           <a rol="button" 
           class="btn btn-danger btn-sm" 
           onclick="cambiare(event,${p.getIdProducto()},${p.isEstadoProducto()},'Producto')"> 
        Inactivar
        </a>
        </c:if>
        <c:if test="${p.isEstadoProducto() == false}">
            <a rol="button" 
            class="btn btn-success btn-sm" 
            onclick="cambiare(event,${p.getIdProducto()},${p.isEstadoProducto()},'Producto')">
        Activar
        </a>
        </c:if> 
        </td>
        
        
        <td>
        <a rol="button" 
        class="btn btn-warning" 
        href="ProductoController?accion=ver&id=${p.getIdProducto()}">
        <i class="bi bi-pencil"></i> 
        </a>

	    <a rol="button" 
	    class="btn btn-danger" 
	    onclick="borrar(event,${p.getIdProducto()},'Producto')">
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
 </div>

<%@include file="footer.jsp" %>