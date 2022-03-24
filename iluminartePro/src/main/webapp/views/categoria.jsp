<%@include file="header.jsp" %>

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">
	
	
 
 <h1><small>Lista de Categorias</small></h1>


  <a type="button" class="btn btn-primary" href="CategoriaController?accion=abrirForm">
  <i class="bi bi-plus-circle"></i> 
  Agregar Categoria
  </a>

 <table class="table table-hover table-bordered" id ="datat">
 <thead>
       <tr>
            <th>Id</th>
            <th><center>Nombre de la Categoria</center></th>
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
        <td> <i class="bi bi-file-person text-success text-center"  style="font-size:30px"  ></i></td> 
        </c:if>
        <c:if test="${categoria.getEstadoCategoria() == false}">
              <td><i class="bi bi-file-person-fill text-danger"  style="font-size:30px" ></i></td> 
        </c:if>
     	
    	<td>
        <c:if test="${categoria.getEstadoCategoria() == true}">
           <a rol="button" 
           
           onclick="cambiare(event,${categoria.getIdCategoria()},${categoria.getEstadoCategoria()},'Categoria')"> 
         <i class="bi bi-toggle-on text-success"  style="font-size:25px"></i>
        </a>
        </c:if>
        <c:if test="${categoria.getEstadoCategoria() == false}">
            <a rol="button" 
         
            onclick="cambiare(event,${categoria.getIdCategoria()},${categoria.getEstadoCategoria()},'Categoria')">
         <i class="bi bi-toggle-off text-danger" style="font-size:25px" ></i>
        </a>
        </c:if> 
        </td>
      
        
        <td>
        <a rol="button" 
      
        href="CategoriaController?accion=verCategoria&id=${categoria.getIdCategoria()}">
          <i class="bi bi-pencil text-warning"  style="font-size:25px"></i>
        </a>
      </td>
 
      <td>
	    <a rol="button" 	
	    onclick="borrar(event,${categoria.getIdCategoria()},'Categoria')">
	    <i class="bi bi-trash text-info" style="font-size:25px" ></i> 
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