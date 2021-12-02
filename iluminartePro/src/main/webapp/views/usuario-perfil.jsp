<%@include file="header.jsp" %>
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

  
  <h1>Perfil de Usuario</h1>
  
  <form method="post" action="UsuarioController?accion=verPerfil">
  	
  	<input type="text" class="form-control" name="id" value="${usua.idUsuario}"/>
 	
  	<div class="form-group">
  	
  	  <label>Tipo Documento</label>
           
                <select class="form-select" name="tipodocumento" autofocus=""  required="">
                      
                 		<c:forEach items="${tip}" var="tip">
                          
                                     
                             <p>${tip.nombreTipoDocumento}</p>
                    	</c:forEach>
                                            
                </select>
                
         
  		 <!--<input type="text" class="form-control" name="tipodocumento" id="tipodocumento" placeholder="Tipo de documento" value="${tip.nombreTipoDocumento}"/>-->
                                             
    </div>
    
	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre" value="${usua.nombreUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="apellido">Apellido</label>
  		<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese el Apellido" value="${usua.apellidoUsuario}"/>
  	</div>
  	
  	 <div class="form-group">
  		<label for="numero">No. Documento</label>
  		<input type="text" class="form-control" name="numero" id="numero" placeholder="Ingrese el No. de Documento" value="${usua.numerodeIdentificacionUsuario}" readonly/>
  	</div>
  	
  	<div class="form-group">
  		<label for="direccion">Direccion</label>
  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la Direccion" value="${usua.direccionUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="telefono">Telefono</label>
  		<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el Telofono" value="${usua.telefonoUsuario}"/>
  	</div>
  	
  	<div class="form-group">
  		<label for="correo">Correo Electronico</label>
  		<input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese el Correo" value="${usua.correoUsuario}"/>
  	</div>
  	

<div>
<button type="submit" class="btn btn-primary">Actualizar Perfil</button>
</div>
  
  </form>
  </div> 
</div>


<%@include file="footer.jsp" %>