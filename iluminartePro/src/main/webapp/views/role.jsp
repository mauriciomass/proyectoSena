<%@include file="header.jsp" %>

<!--  <div class="flex-fill flex-grow-1 ms-3">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
						<div class="full-width panel mdl-shadow--5dp">

  <h1>Lista de Roles</h1>
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
            <th colspan="2"><center>Acciones</center></th>
        </tr>
   </thead>
<tbody>      
<c:forEach var="tiporol" items="${roles}">         
        
        <tr>
        <td>${tiporol.getIdRol()}</td>
        <td>${tiporol.getNombreRol()}</td>
     	 <c:if test="${tiporol.getEstadoRol() == true}">
           <td><span class="badge bg-success active">Usuario Activo</span></td> 
        </c:if>
        <c:if test="${tiporol.getEstadoRol() == false}">
            <td><span class="badge bg-danger active">Usuario Inactivo</span></td> 
        </c:if>
        
        <td>
        <c:if test="${tiporol.getEstadoRol() == true}">
           <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>
           class="btn btn-danger btn-sm" 
           onclick="cambiare(event,${tiporol.getIdRol()},${tiporol.getEstadoRol()},'TipoRol')"> 
        Inactivar
        </a>
        </c:if>
        <c:if test="${tiporol.getEstadoRol() == false}">
            <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>
            class="btn btn-success btn-sm" 
            onclick="cambiare(event,${tiporol.getIdRol()},${tiporol.getEstadoRol()},'TipoRol')">
        Activar
        </a>
        </c:if> 
        </td>
        
        
        <td>
        <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>
        class="btn btn-warning" 
        href="TipoRolController?accion=verRol&id=${tiporol.getIdRol()}">
        <i class="bi bi-pencil"></i> 
        </a>

	    <a rol="button" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>
	    class="btn btn-danger" 
	    onclick="borrar(event,${tiporol.getIdRol()},'TipoRol')">
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