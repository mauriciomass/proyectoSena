<%@include file="header.jsp" %>
	<link rel="stylesheet" href="css/Estilos_usu_edi.css">
<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">

 <div class="contenedor__todo">
				
				  <div class="formulario__register">

  
  <h1>Editar Usuario</h1>
  
  <form method="post" action="UsuarioController?accion=edit">
  	
  	<input type="hidden" class="form-control" name="id" value="${user.idUsuario}"/>
  	<input type="hidden" class="form-control" name="contrasena" id="contrasena" value="${user.contrasenaUsuario}"/>
 	
  	<div class="form-group">
  	  <label>Tipo Documento</label>
           
                <select class="form-select" name="tipodocumento" autofocus=0 id="tipodocumento">
                      
                 		<c:forEach items="${tip}" var="tip">
                            <option value="${tip.idTipoDocumento}" 
                             <c:if test="${tip.idTipoDocumento == user.idTipodeDocumentoFK.idTipoDocumento}">
                                   selected
                             </c:if>         
                             >${tip.nombreTipoDocumento}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
    <div id="tipoDocVal" class="text-danger"> </div>
    
     <div class="form-group">
  	  <label>Rol de Usuario</label>
           
                <select class="form-select" name="tiporol" id="tiporol">
                       <c:forEach items="${roles}" var="rol">
                            <option value="${rol.idRol}" 
                            <c:if test="${rol.idRol == user.idRolFK.idRol}">
                                   selected
                             </c:if>          
                             >${rol.nombreRol}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
	<div id="tipoRolVal" class="text-danger"> </div>

  	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre" value="${user.nombreUsuario}" required onBlur="verifyEdir()"/>
  	</div>
  	
  	<div id="nombreVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="apellido">Apellido</label>
  		<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese el Apellido" value="${user.apellidoUsuario}" required onBlur="verifyEdir()"/>
  	</div>
  	<div id="apellidoVal" class="text-danger"> </div>
  	
  	 <div class="form-group">
  		<label for="numero">No. Documento</label>
  		<input type="text" class="form-control" name="numero" id="numero" placeholder="Ingrese el No. de Documento" value="${user.numerodeIdentificacionUsuario}" required onBlur="verifyEdir()"/>
  	</div>
  	
  	<div id="numdocumVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="direccion">Direcci&#243;n</label>
  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la Direcci&#243;n" value="${user.direccionUsuario}" required onBlur="verifyEdir()"/>
  	</div>
  	
  	<div id="direccionVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="telefono">N&#250;mero de Contacto</label>
  		<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el n&#250;mero de contacto" value="${user.telefonoUsuario}" required onBlur="verifyEdir()"/>
  	</div>
  	
  	<div id="contactoVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="correo">Correo Electr&#243;nico</label>
  		<input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese el Correo" value="${user.correoUsuario}" required onBlur="verifyEdir()"/>
  	</div>
  	
  	<div id="mensaje" class="text-danger"> </div>
  	
  	<div class="form-check">
  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" checked>
  <label class="form-check-label" for="flexCheckChecked">
    Activo
  </label>
</div>
  	

<div class="d-flex justify-content-end">
<button class="btn btn-secondary btn-sm" name="Cancelar" id="Cancelar">Cancelar</button>
<button type="submit" class="btn btn-success btn-sm" id="guardarUsuario" disabled="disabled" onclick="guardar()">Guardar</button>
</div>
  
  </form>
  </div> 
</div>
  </div> 
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
	
function verifyEdir(){
		const correo=document.getElementById("correo").value;
		const guardarUsuario=document.getElementById("guardarUsuario");
		const nombre=document.getElementById("nombre").value;
		const apellido=document.getElementById("apellido").value;
		const numero=document.getElementById("numero").value;
		const direccion=document.getElementById("direccion").value;
		const telefono=document.getElementById("telefono").value;
		
		var listatd = document.getElementById("tipodocumento");
		
		var indicetd = listatd.selectedIndex;
		
		var opciontd = listatd.options[indicetd];
		
		var valortd = opciontd.value;
		
		var listatr = document.getElementById("tiporol");
		
		var indicetr = listatr.selectedIndex;
		
		var opciontr = listatr.options[indicetr];
		
		var valortr = opciontr.value;
		
		console.log(valortd)
		console.log(valortr)
		console.log(nombre)
		console.log(apellido)
		console.log(numero)
		console.log(direccion)
		console.log(telefono)
		$.ajax({
			  url: "UsuarioController?accion=validarFormEdit",
			  data: {
			    correo: correo,
			    tipodocumento:valortd,
			    tiporol: valortr,
			    nombre: nombre,
			    apellido: apellido,
			    numero: numero,
			    direccion: direccion,
			    telefono: telefono
			  },
			  success: function( resultEdit ) {
				  partes= resultEdit.split(";");
				  console.log(partes)
		  		  $("#mensaje").html("");	
			      $("#nombreVal").html("");
			      $("#apellidoVal").html("");
			      $("#numdocumVal").html("");
			      $("#direccionVal").html("");
			      $("#contactoVal").html("");
			      $("#tipoDocVal").html("");
			      $("#tipoRolVal").html("");
				  if (partes[0]=="false" && partes[1] =="formatocorreo"){
						  $("#mensaje").html( "<strong>" + partes[2] + "</strong>" );
						  $('#guardarUsuario').attr('disabled', 'disabled');
					      $("#nombreVal").html("");
					      $("#apellidoVal").html("");
					      $("#numdocumVal").html("");
					      $("#direccionVal").html("");
					      $("#contactoVal").html("");
					      $("#tipoDocVal").html("");
					      $("#tipoRolVal").html("");
					
						  						  
					  }				  

				 else if (partes[0]=="false" && partes[1] =="formatotipodocumento"){					      
					  $('#tipoDocVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
			  		  $("#mensaje").html("");	
				      $("#nombreVal").html("");
				      $("#apellidoVal").html("");
				      $("#numdocumVal").html("");
				      $("#direccionVal").html("");
				      $("#contactoVal").html("");
				      $("#tipoRolVal").html("");
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatotiporol"){					      
					  $('#tipoRolVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatonombre"){					      
						  $('#nombreVal').html( "<strong>" + partes[2] + "</strong>" );
						  $('#guardarUsuario').attr('disabled', 'disabled');
				  		  $("#mensaje").html("");	
					      $("#apellidoVal").html("");
					      $("#numdocumVal").html("");
					      $("#direccionVal").html("");
					      $("#contactoVal").html("");
					      $("#tipoDocVal").html("");
					      $("#tipoRolVal").html("");
					
						  
					  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatoapellido"){					      
					  $('#apellidoVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
			  		  $("#mensaje").html("");	
				      $("#nombreVal").html("");
				      $("#numdocumVal").html("");
				      $("#direccionVal").html("");
				      $("#contactoVal").html("");
				      $("#tipoDocVal").html("");
				      $("#tipoRolVal").html("");
					
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatonumdocum"){					      
					  $('#numdocumVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
			  		  $("#mensaje").html("");	
				      $("#nombreVal").html("");
				      $("#apellidoVal").html("");
				      $("#direccionVal").html("");
				      $("#contactoVal").html("");
				      $("#tipoDocVal").html("");
				      $("#tipoRolVal").html("");
					
				  } 
				  
				  else if (partes[0]=="false" && partes[1] =="formatodireccion"){					      
					  $('#direccionVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
			  		  $("#mensaje").html("");	
				      $("#nombreVal").html("");
				      $("#apellidoVal").html("");
				      $("#numdocumVal").html("");
				      $("#contactoVal").html("");
				      $("#tipoDocVal").html("");
				      $("#tipoRolVal").html("");
				
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatocontacto"){					      
					  $('#contactoVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
			  		  $("#mensaje").html("");	
				      $("#nombreVal").html("");
				      $("#apellidoVal").html("");
				      $("#numdocumVal").html("");
				      $("#direccionVal").html("");
				      $("#tipoDocVal").html("");
				      $("#tipoRolVal").html("");
				
					  
				  }
				  			  
				  else if (partes[0]=="true"){
					  console.log("Validado")					  
					  $('#formVal').html( "<small>" + partes[1] + "</small>" );
					  $("#guardarUsuario").removeAttr("disabled");
			  		  $("#mensaje").html("");	
				      $("#nombreVal").html("");
				      $("#apellidoVal").html("");
				      $("#numdocumVal").html("");
				      $("#direccionVal").html("");
				      $("#contactoVal").html("");
				      $("#tipoDocVal").html("");
				      $("#tipoRolVal").html("");
				      
				  }
				  
			   }
				      
		});
};

</script>

<%@include file="footer.jsp" %>