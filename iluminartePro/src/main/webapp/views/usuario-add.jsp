
<%@include file="header.jsp" %>


<!--  <div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
	<div class="full-width panel mdl-shadow--5dp">-->

<div class="d-flex justify-content-center align-items-center">

	
			<div class="col-sm-3">
			
			
				<div class="card">
				
					<div class="card-body">
  
  <h1>Registro de Usuarios</h1>
  
  <form method="post" action="UsuarioController?accion=add" novalidate onchange="verifyCorreo()">
  	

	<div class="form-group">
  	  <label>Tipo Documento</label>
           
                <select class="form-select" aria-label="Default select example" name="tipodocumento" required>
                      <option value="0">Seleccione el tipo de documento</option>
                 		<c:forEach items="${tip}" var="tip">
                            <option value="${tip.idTipoDocumento}"         
                             >${tip.nombreTipoDocumento}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>

    <div id="tipoDocVal" class="text-danger"> </div>
    
     <div class="form-group">
  	  <label>Rol de Usuario</label>
           
                <select class="form-select" aria-label="Default select example" name="tiporol" required>
                    <option value="0">Seleccione un rol de usuario</option>
                 		<c:forEach items="${roles}" var="rol">
                            <option value="${rol.idRol}"         
                             >${rol.nombreRol}</option>
                    	</c:forEach>
                                            
                </select>
                                             
    </div>
    
    <div id="tipoRolVal" class="text-danger"> </div>
    
	<div class="form-group">
  		<label for="correo">Correo Electronico</label>
  		<input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese el Correo" required/>
  	</div>
  	<div id="mensaje" class="text-danger"> </div>

  	
  	<div class="form-group">
  		<label for="nombre">Nombre</label>
  		<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese el Nombre" required/>
  	</div>
  	
  	<div id="nombreVal" class="text-danger"> </div>
  	
  	
  	<div class="form-group">
  		<label for="apellido">Apellido</label>
  		<input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese el Apellido" required/>
  	</div>
  	
  	<div id="apellidoVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="contrasena">Contrasena</label>
  		<input type="password" class="form-control" name="contrasena" id="contrasena" placeholder="Ingrese la contrasena" />
  	</div>
  	
  	 <div class="form-group">
  		<label for="numero">No. Documento</label>
  		<input type="text" class="form-control" name="numero" id="numero" placeholder="Ingrese el No. de Documento" required/>
  	</div>
  	
  	<div id="numdocumVal" class="text-danger"> </div>
  	  	
  	<div class="form-group">
  		<label for="direccion">Direccion</label>
  		<input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese la Direccion" required/>
  	</div>
  	  	
  	<div id="direccionVal" class="text-danger"> </div>
  	
  	<div class="form-group">
  		<label for="telefono">Contacto</label>
  		<input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese el Número de Contacto"  required/>
  	</div>
  	  	
  	<div id="contactoVal" class="text-danger"> </div>
  	  	
  	<div class="form-check">
  <input class="form-check-input" type="checkbox" name="chkEstado" id="chkEstado" checked>
  <label class="form-check-label" for="flexCheckChecked">
    Activo
  </label>
</div>

<div id="formVal" class="small text-info"> </div>

<div class="d-flex justify-content-end">
	<button type="submit" class="btn btn-secondary btn-sm">Cancelar</button>
	<button type="submit" class="btn btn-success btn-sm" id="guardarUsuario" disabled="disabled">Guardar</button>
</div>
  
  </form>
  </div> 
</div>
</div>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

	
	
	

	function verifyCorreo(){
		const correo=document.getElementById("correo").value;
		const guardarUsuario=document.getElementById("guardarUsuario");
		/*const tipodocumento=document.getElementById("tipodocumento").value;
		const tiporol=document.getElementById("tiporol").value;*/
		const nombre=document.getElementById("nombre").value;
		const apellido=document.getElementById("apellido").value;
		const numero=document.getElementById("numero").value;
		const direccion=document.getElementById("direccion").value;
		const telefono=document.getElementById("telefono").value;
		console.log(correo)
		/*console.log(tipodocumento)
		console.log(tiporol)*/
		console.log(nombre)
		console.log(apellido)
		console.log(numero)
		console.log(direccion)
		console.log(telefono)
		$.ajax({
			  url: "UsuarioController?accion=validarFormulario",
			  data: {
			    correo: correo,
			    /*tipodocumento:tipodocumento,
			    tiporol: tiporol,*/
			    nombre: nombre,
			    apellido: apellido,
			    numero: numero,
			    direccion: direccion,
			    telefono: telefono
			  },
			  success: function( result ) {
				  partes= result.split(";");
				  console.log(partes)
		  		  $("#mensaje").html("");	
			      $("#nombreVal").html("");
			      $("#apellidoVal").html("");
			      $("#numdocumVal").html("");
			      $("#direccionVal").html("");
			      $("#contactoVal").html("");
			      /*$("#tipoDocVal").html("");
			      $("#tipoRolVal").html("");*/
				  if (partes[0]=="false" && partes[1] =="formatocorreo"){
						  $("#mensaje").html( "<strong>" + partes[2] + "</strong>" );
						  $('#guardarUsuario').attr('disabled', 'disabled');
						  						  
					  }				  

				 /*else if (partes[0]=="false" && partes[1] =="formatotipodocumento"){					      
					  $('#tipoDocVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatotiporol"){					      
					  $('#tipoRolVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  }*/
				  
				  else if (partes[0]=="false" && partes[1] =="formatonombre"){					      
						  $('#nombreVal').html( "<strong>" + partes[2] + "</strong>" );
						  $('#guardarUsuario').attr('disabled', 'disabled');
						  
					  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatoapellido"){					      
					  $('#apellidoVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatonumdocum"){					      
					  $('#numdocumVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  } 
				  
				  else if (partes[0]=="false" && partes[1] =="formatodireccion"){					      
					  $('#direccionVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  }
				  
				  else if (partes[0]=="false" && partes[1] =="formatocontacto"){					      
					  $('#contactoVal').html( "<strong>" + partes[2] + "</strong>" );
					  $('#guardarUsuario').attr('disabled', 'disabled');
					  
				  }
				  			  
				  else if (partes[0]=="true"){
					  console.log("Validado")					  
					  $('#formVal').html( "<small>" + partes[1] + "</small>" );
					  $("#guardarUsuario").removeAttr("disabled");

				  }
				  
			   }
			});
	}

</script>


<%@include file="footer.jsp" %>