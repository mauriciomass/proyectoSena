<%@include file="header.jsp" %>
<!--  <div class="flex-fill flex-grow-1 ms-3 overflow-hidden">-->

<div class="mdl-tabs__tab-bar">
 
 <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--8-col-desktop mdl-cell--2-offset-desktop">
<div class="full-width panel mdl-shadow--5dp"> 

		<h1>Registrar Venta</h1>
		
			<div class="col-sm-4">
			
			<form action="VentasController?accion=NuevaVenta" method="POST">
				<div class="card">
				
					<div class="card-body">
					
						<div class="form-group">
						
							<label>Datos del Cliente</label>
						
						</div>
						
						<div class="form-group d-flex">
						
							<div class="col-sm-6">
							
								<input type="text" name="codigocliente" value="${c.getNumerodeIdentificacionUsuario()}" class="form-control" placeholder="codigo">
								<input type="submit" value="BuscarCliente" class="btn btn-outline-info">
							</div>
							
							
							<div class="col-sm-6">
							
								<input type="text" name="nombrescliente" value="${c.getNombreUsuario()}" placeholder="Datos del Cliente" class="form-control col-sm-6">
							</div>
							
							
						
						</div>
						
						<div class="form-group">
						
						<label>Datos Producto</label>				
														
						</div>
						
				
						<div class="form-group d-flex">
						
							<div class="col-sm-6 d-flex">
							
								<input type="text" name="codigoproducto" class="form-control" placeholder="codigo">
								<input type="submit" name="accion" value="Buscar" class="btn btn-outline-info">
							</div>
							
			
	
						</div>
						
						<div class="form-group d-flex">
						
							<div class="col-sm-6 d-flex">
							
								<input type="text" name="precio" class="form-control" placeholder="s/.0.00">
								
							</div>
							
							
							<div class="col-sm-3">
							
								<input type="number" name="cant" placeholder="" class="form-control">
							</div>
							
							<div class="col-sm-3">
							
								<input type="text" name="stock" placeholder="stock" class="form-control">
							</div>
							
							<div class="form-group">
							
								<input type="submit" name="accion" value="Agregar" class="btn btn-outline-info">
							
							</div>
							
						
						</div>
					
					</div>
				
				</div>
		
				</form>
			</div>
	
		</div>
		
		<div>
			<div class="col-ms-7">
			
			<div class="card">
				<div class="card-body">
				
					</div>
							<div class="d-flex col-sm-6 ml-auto">
								<label>NumeroSerie</label>
									<input type="text" name="Nroserie" class="form-control">
							</div>
					
					</div>
					<br>		
				<table class="table table-hover">
				
					<thead>
						<tr>
							<th>Nro</th>
							<th>Codigo</th>
							<th>Descripcion</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>SubTotal</th>
							<th>Acciones</th>
						
						</tr>
						
					 </thead>
					 
					 <tbody>
					 	<tr>
					 		<td></td>
					 		<td></td>
					 		<td></td>
					 		<td></td>
					 		<td></td>
					 		<td></td>
					 	
					 	</tr>
					 
					 
					 </tbody>
				
					
				
				</table>
				
				</div>
			
				<div class="card-footer">
					<div>
					
						<input type="submit" name="accion" value="Generar Venta" class="btn btn sucess">
						<input type="submit" name="accion" value="Cancelar" class="btn btn danger">
					</div>
				
				</div>	
		</div>
		
	</div>

</div>



<%@include file="footer.jsp" %>