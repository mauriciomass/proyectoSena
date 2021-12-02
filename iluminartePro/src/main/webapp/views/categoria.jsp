<%@include file="header.jsp" %>

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
	

  <h1>Lista de Categorias</h1>
  <a type="button" class="btn btn-primary" href="CategoriaController?accion=abrirForm">
  <i class="bi bi-plus-circle"></i> 
  Agregar Categoria
  </a>

 <table class="table table-hover table-bordered" id ="datat">
 <thead>
       <tr>
            <th>Id</th>
            <th>Nombre de la Categoria</th>
            <th><center>Descripción de la Categoria</center></th>  
            <th><center>Estado</center></th>            
            <th colspan="3"><center>Acciones</center></th>
        </tr>
 </thead>
 <tbody>      
<c:forEach var="categoria" items="${categorias}">         
        
        <tr>
        <td>${categoria.getIdCategoria()}</td>
        <td>${categoria.getNombreCategoria()}</td>
     	<td>${categoria.getDescripcionCategoria()}</td>
     	
     	<c:if test="${categoria.getEstadoCategoria() == true}">
           <td><span class="badge bg-success active">Categoria Activo</span></td> 
        </c:if>
        <c:if test="${categoria.getEstadoCategoria() == false}">
            <td><span class="badge bg-danger active">Categoria Inactivo</span></td> 
        </c:if>
     	
    	<td>
        <c:if test="${categoria.getEstadoCategoria() == true}">
           <a rol="button" 
           class="btn btn-danger btn-sm" 
           onclick="cambiare(event,${categoria.getIdCategoria()},${categoria.getEstadoCategoria()},'Categoria')"> 
        Inactivar
        </a>
        </c:if>
        <c:if test="${categoria.getEstadoCategoria() == false}">
            <a rol="button" 
            class="btn btn-success btn-sm" 
            onclick="cambiare(event,${categoria.getIdCategoria()},${categoria.getEstadoCategoria()},'Categoria')">
        Activar
        </a>
        </c:if> 
        </td>
      
        
        <td>
        <a rol="button" 
        class="btn btn-warning" 
        href="CategoriaController?accion=verCategoria&id=${categoria.getIdCategoria()}">
        <i class="bi bi-pencil"></i> 
        </a>

	    <a rol="button" 
	    class="btn btn-danger" 
	    onclick="borrar(event,${categoria.getIdCategoria()},'Categoria')">
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