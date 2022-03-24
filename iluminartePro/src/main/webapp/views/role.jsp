<%@include file="header.jsp" %>

<!--  <div class="flex-fill flex-grow-1 ms-3">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--5dp">

 <h1><small>Lista de Roles</small></h1>
  <a type="button" class="btn btn-primary" href="TipoRolController?accion=abrirForm" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
  <i class="bi bi-plus-circle"></i> 
  Agregar Rol
  </a>

 <table class="table table-hover table-bordered" id ="datat">
  <thead>
       <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th><center>Estado</center></th> 
                       
            <th colspan="3"><center>Acciones</center></th>
       </tr>
   </thead>
<tbody>      
<c:forEach var="tiporol" items="${roles}">         
        
        <tr>
        <td>${tiporol.getIdRol()}</td>
        <td>${tiporol.getNombreRol()}</td>
     	 <c:if test="${tiporol.getEstadoRol() == true}">
           <td> <i class="bi bi-file-person text-success text-center"  style="font-size:30px"  ></i></td> 
        </c:if>
        <c:if test="${tiporol.getEstadoRol() == false}">
            <td><i class="bi bi-file-person-fill text-danger"  style="font-size:30px" ></i></td> 
        </c:if>
        
        
        
        
  
        <td>
        <c:if test="${tiporol.getEstadoRol() == true}">
           <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>          
           onclick="cambiare(event,${tiporol.getIdRol()},${tiporol.getEstadoRol()},'TipoRol')"> 
          <i class="bi bi-toggle-on text-success"  style="font-size:25px" ></i>
        </a>
        </c:if>
        <c:if test="${tiporol.getEstadoRol() == false}">
            <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>            
            onclick="cambiare(event,${tiporol.getIdRol()},${tiporol.getEstadoRol()},'TipoRol')">
         <i class="bi bi-toggle-off text-danger" style="font-size:25px" ></i>
        </a>
        </c:if> 
        </td>
        
        
        
        
        <td>
        <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>       
        href="TipoRolController?accion=verRol&id=${tiporol.getIdRol()}">
        <i class="bi bi-pencil text-warning"  style="font-size:25px"></i> 
        </a>
        </td>
        
        <td>
              
	    <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>  
	    onclick="borrar(event,${tiporol.getIdRol()},'TipoRol')">
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