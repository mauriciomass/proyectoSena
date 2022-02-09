<%@include file="header.jsp" %>
<!--  <div class="flex-fill flex-grow-1 ms-3 overflow-hidden">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
<div class="full-width panel mdl-shadow--5dp"> 

		<h1>Registrar Venta</h1>
		
<form action="VentasController"  method="POST">		
	<div class="d-flex">
		
			<div class="col-sm-8 parte03">
			
			
				<div class="card">
				
					<div class="card-body">
					
						<div class="form-group">
						
							<label>Datos del Cliente</label>
							
							  
						
						</div>
						
						<div class="form-group d-flex">
						
							<div class="col-sm-6 d-flex">
							
								<input type="hidden" name="tiporolVend" value="${usua.numerodeIdentificacionUsuario}" class="form-control">
								<input type="text" name="codigocliente" value="${c.getNumerodeIdentificacionUsuario()}"  class="form-control col-sm-6" placeholder="Documento">
								<button type="submit" name="accion" value="BuscarCliente"  class="btn btn-outline-info bi bi-search"  ></button>
								
								
							
							
							<div class="col-sm-6 d-flex">
							
								<input type="text" name="nombrescliente" value="${c.getNombreUsuario()}" placeholder="Datos del Cliente" class="form-control col-sm-6" readonly>
							</div>
							
						   </div>
						
						</div>
						
						<hr>
						<div class="form-group me-2">
						
						<label>Datos Producto</label>				
														
						</div>
						
				
						<div class="form-group d-flex">
						
							<div class="col-sm-6 d-flex">
							
								<input type="text" name="codigoproducto" class="form-control" placeholder="codigo">
								<button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info bi bi-search" ></button>
							</div>
							
							<div class="col-sm-6 d-flex">
							
								<input type="text" name="nomproducto" value="${producto.getNombreProducto()}" class="form-control col-sm-6" placeholder="Datos del producto" readonly>
								
							</div>
	
						</div>
						
						<div class="form-group d-flex">
						
							<div class="col-sm-6 d-flex">
							
								<input type="text" name="precio" value="${producto.getPrecioProducto()}" class="form-control" placeholder="s/.0.00" readonly >
								
							</div>
							
							
							<div class="col-sm-3">
							
								<input type="number" value="1" name="cant" placeholder="" class="form-control" id ="cant" onkeyup="validarStock(this.value)" onclick= "validarStock(this.value)">
							</div>
							
							<div class="col-sm-3">
							
								<input type="text" name="stock" id="stock" value="${producto.getStockProducto()}" placeholder="stock" class="form-control" readonly >
							</div>
							
						</div>			
								
							<hr>
							   <img src='${producto.getImagenProducto()}'/>								
							   <button type="submit" name="accion" value="Agregar" class="btn btn-outline-primary col text-center">Agregar</button>
							
												
						</div>
					
					</div>
				
				</div>
		
				
			</div>
	
		</div>
	
		<div>
			<div class="col-ms-7">
			
			<div class="card">
				<div class="card-body">
				
					</div>
							<div class="d-flex">
								<label class="col-sm-6 col-form-label">NumeroSerie</label>
								<input type="text" name="Nroserie" value="${nserie}" class="form-control" readonly>
							</div>
					
					</div>
					<br>		
				<table class="table table-hover" id="table">
				
					<thead>
						<tr>
							<th>Nro</th>
							<th>Codigo</th>
							<th>Descripcion</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>SubTotal</th>
							<th class="accion">Acciones</th>
						
						</tr>
						
					 </thead>
					 
					 <tbody>
					 <c:forEach var="list" items="${lista}">
					 	<tr>
					 		<td>${list.getItem()}</td>
					 		<td>${list.getCodProducto()}</td>
					 		<td>${list.getDescripcionPedido()}</td>
					 		<td>${list.getPrecio()}</td>
					 		<td><input type="number" name="valcant" value="${list.getCantidad()}"></td>
					 		<td id="subtotal">${list.getSubtotal()}</td>
					 		<td class="d-flex">
					 			<!--  <a href="#" class="btn btn-warning">Editar</a>-->
					 			<button type="submit" name="accion" value="editaId_${list.getIdProducto()}" class="btn btn-warning bi bi-pencil" ></button>					 			
					 			<button type="submit" name="accion" value="eliminaId_${list.getIdProducto()}" class="btn btn-danger bi bi-trash" ></button>
					 		</td>
					 	
					 	</tr>
					 
					 </c:forEach>
					 
					 </tbody>
				
					
				
				</table>
				
				</div>
				
			
			
				<div class="card-footer d-flex">
					<div class="col-sm-6">
						<a type="submit" href="VentasController?menu=NuevaVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">Generar Venta </a>
						<input type="submit" name="accion" value="Cancelar" class="btn btn danger">
					</div>
					
					<div class="col-sm-4 ml-auto">
					
						<input type="text"  id="res" name="txtTotal" value="${totalpagar}" class="form-control" readonly>
						
					</div>
				
				</div>	
		</div>
	</form>		
	</div>

</div>

<script>


function validarStock(value){ 

	var cant = document.getElementById('cant');
	var stock = parseInt(document.getElementById('stock').getAttribute("value"));
	
	console.log("value: ",value);
	console.log("cant: ",cant);
	console.log("stock: ",stock);
	
	console.log("validación inventario",(value > stock));
	
	if(value >stock){
		
		alert("Error: El valor de la cantidad es mayor al stock del producto");
	}
	
};
			

</script>



<%@include file="footer.jsp" %>