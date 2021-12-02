<%@include file="header.jsp" %>

<!--  <div class="flex-fill flex-grow-1 ms-3 overflow-hidden">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
<div class="full-width panel mdl-shadow--5dp"> 

<h1>Lista de Usuarios</h1>
  <a type="button" class="btn btn-primary" href="UsuarioController?accion=abrirForm" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
  <i class="bi bi-plus-circle"></i> 
  Agregar Usuario
  </a>
<div class="table-responsive">
 <table class="table table-hover table-bordered" id ="datat">
 
 <thead>
       <tr>
            <th>Id</th>
            <th>Tipo de documento </th>
            <th>Rol </th>
            <th>Nombre <br>Usuario</th>
            <th>Apellido <br>Usuario</th>
            <th>Numero de identificacion</th>
            <th>Direccion</th>
            <th>Telefono</th>
            <th>Correo</th>
                    
            <th><center>Estado</center></th>            
            <th colspan="2"><center>Acciones</center></th>
       </tr>
        
 </thead>

<tbody>
<c:forEach var="u" items="${user}">         
        
        <tr>
        <td>${u.getIdUsuario()}</td>
        <td>${u.idTipodeDocumentoFK.nombreTipoDocumento}</td>
        <td>${u.idRolFK.nombreRol}</td>
        
        
        <td>${u.getNombreUsuario()}</td>
        <td>${u.getApellidoUsuario()}</td>        
        <td>${u.getNumerodeIdentificacionUsuario()}</td>        
        <td>${u.getDireccionUsuario()}</td>
        <td>${u.getTelefonoUsuario()}</td>
        <td>${u.getCorreoUsuario()}</td>
        

        
     	 <c:if test="${u.isEstadoUsuario() == true}">
           <td><span class="badge bg-success active">Usuario Activo</span></td> 
        </c:if>
        <c:if test="${u.isEstadoUsuario() == false}">
            <td><span class="badge bg-danger active">Usuario Inactivo</span></td> 
        </c:if>
        
        <td>
        <c:if test="${u.isEstadoUsuario() == true}">
           <a rol="button" 
           class="btn btn-danger btn-sm" 
           onclick="cambiare(event,${u.getIdUsuario()},${u.isEstadoUsuario()},'Usuario')" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>> 
        Inactivar
        </a>
        </c:if>
        <c:if test="${u.isEstadoUsuario() == false}">
            <a rol="button" 
            class="btn btn-success btn-sm" 
            onclick="cambiare(event,${u.getIdUsuario()},${u.isEstadoUsuario()},'Usuario')" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
        Activar
        </a>
        </c:if> 
        </td>
        
        
        <td>
        <a rol="button" 
        class="btn btn-warning" 
        href="UsuarioController?accion=ver&id=${u.getIdUsuario()}" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
        <i class="bi bi-pencil"></i> 
        </a>

	    <a rol="button" 
	    class="btn btn-danger" 
	    onclick="borrar(event,${u.getIdUsuario()},'Usuario')" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
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