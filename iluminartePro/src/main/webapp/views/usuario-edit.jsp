<%@include file="header.jsp" %>
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

  
  <h1>Registro de Usuarios</h1>
  
  <form method="post" action="UsuarioController?accion=edit">
  	
  	<input type="hidden" class="form-control" name="id" value="${user.idUsuario}"/>
  	<input type="hidden" class="form-control" name="contrasena" id="contrasena" value="${user.contrasenaUsuario}"/>
 	
  	<div class="form-group">
  	  <label>Tipo Documento</label>
           
                <select class="form-select" name="tipodocumento" autofocus=""  required="">
                      
                 		<c:forEach items="${tip}" var="tip">
                            <option value="${tip.idTipoDocumento}" 
                             <c:if test="${tip.idTipoDocumento == user.idTipodeDocumentoFK.idTipoDocumento}">
                                   selected
                             </c:if>         
                             >${tip.nombreTipoDocumento}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
     <div class="form-group">
  	  <label>Rol de Usuario</label>
           
                <select class="form-select" name="tiporol">
                       <c:forEach items="${roles}" var="rol">
                            <option value="${rol.idRol}" 
                            <c:if test="${rol.idRol == user.idRolFK.idRol}">
                                   selected
                             </c:if>          
                             >${rol.nombreRol}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    


  	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre" value="${user.nombreUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="apellido">Apellido</label>
  		<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese el Apellido" value="${user.apellidoUsuario}"/>
  	</div>
  	
  	 <div class="form-group">
  		<label for="numero">No. Documento</label>
  		<input type="text" class="form-control" name="numero" id="numero" placeholder="Ingrese el No. de Documento" value="${user.numerodeIdentificacionUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="direccion">Direccion</label>
  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la Direccion" value="${user.direccionUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="telefono">Telefono</label>
  		<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el Telofono" value="${user.telefonoUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="correo">Correo Electronico</label>
  		<input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese el Correo" value="${user.correoUsuario}"/>
  	</div>
  	
  	<div class="form-check">
  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" checked>
  <label class="form-check-label" for="flexCheckChecked">
    Activo
  </label>
</div>

<div>
<button type="submit" class="btn btn-primary">Guardar</button>
</div>
  
  </form>
  </div> 
</div>


<%@include file="footer.jsp" %>