<%@include file="header.jsp" %>

<!--  <div class="flex-fill flex-grow-1 ms-3 overflow-hidden">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
<div class="full-width panel mdl-shadow--5dp"> 




<h1><small>Lista de Usuarios</small></h1>
  <a type="button" class="btn btn-success" href="UsuarioController?accion=abrirForm" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
  <i class="bi bi-plus-circle"></i> 
  Agregar Usuario
  </a>
  <a type="button" class="btn btn-primary" href="UsuarioController?accion=reporteUsuarios" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
  <i class="bi bi-plus-circle"></i> 
  Reporte Usuarios
  </a>
<div class="table-responsive">
 <table class="table table-hover table-bordered" id ="datat">
 
 <thead>
 <div class="container-fluid">
 
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
                 
            <th colspan="3"><center>Acciones</center></th>
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
        <td> <i class="bi bi-file-person text-success text-center"  style="font-size:30px"  ></i></td> 
        </c:if>
        <c:if test="${u.isEstadoUsuario() == false}">
              <td><i class="bi bi-file-person-fill text-danger"  style="font-size:30px" ></i></td> 
        </c:if>
     	
        <td>
        <c:if test="${u.isEstadoUsuario() == true}">
        <a rol="button" 
         onclick="cambiare(event,${u.getIdUsuario()},${u.isEstadoUsuario()},'Usuario')" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
        <i class="bi bi-toggle-on text-success"  style="font-size:30px"></i>
 
        </a>
        </c:if>
        <c:if test="${u.isEstadoUsuario() == false}">
            <a rol="button" 
                onclick="cambiare(event,${u.getIdUsuario()},${u.isEstadoUsuario()},'Usuario')" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
           <i class="bi bi-toggle-off text-danger" style="font-size:30px"></i>
        </a>
        </c:if> 
        </td>
        
        
        <td>
        <a rol="button" 
        href="UsuarioController?accion=ver&id=${u.getIdUsuario()}" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
        <i class="bi bi-pencil text-warning" style="font-size:25px"></i> 
        </a>
        
           </td>

           <td>

	    <a rol="button" 	 
	    onclick="borrar(event,${u.getIdUsuario()},'Usuario')" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
	    <i class="bi bi-trash text-info"  style="font-size:25px" ></i> 
	    </a>
	    
	    </td>
        <tr>
        
</c:forEach>    

</body>
</div>
</table>
</div>
</div>
 </div> 
 </div>


<%@include file="footer.jsp" %>