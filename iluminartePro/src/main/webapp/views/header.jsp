 <%@page session="true" %>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
response.setDateHeader("Expires", 0);
//Recoger datos de sesión
if(session.getAttribute("usua")!=null){
	
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Este header es del dashboard -->
<!DOCTYPE html>
<html lang="es-ES">
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Iluminarte</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/sweetalert2.css">
	<link rel="stylesheet" href="css/material.min.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/mobius1/vanilla-Datatables@latest/vanilla-dataTables.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/mobius1/vanilla-Datatables@latest/vanilla-dataTables.min.js"></script>
	
			<style>
		
			@media print{
			
				.parte01,.parte02, .parte03, .btn, .accion {
					display:none;
				}
			
			}
		
		</style>
	
</head>
<body>
	
	<!-- navBar -->
	<div class="full-width navBar parte01">
		<div class="full-width navBar-options">
			<i class="zmdi zmdi-more-vert btn-menu" id="btn-menu"></i>	
			<div class="mdl-tooltip" for="btn-menu">Menu</div>
			<nav class="navBar-options-list">
				<ul class="list-unstyle">
					<li class="btn-Notification" id="notifications">
						<i class="zmdi zmdi-notifications"></i>
						<!-- <i class="zmdi zmdi-notifications-active btn-Notification" id="notifications"></i> -->
						<div class="mdl-tooltip" for="notifications">Notifications</div>
					</li>
					<li class="btn-exit" id="btn-exit">
						<i class="zmdi zmdi-power"></i>
						<div class="mdl-tooltip" for="btn-exit">LogOut</div>
					</li>
					<li class="text-condensedLight noLink" ><small>${usua.getNombreUsuario()} ${usua.getApellidoUsuario()}</small></li>
					<li class="noLink">
						<figure>
							<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
						</figure>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- navLateral -->
	<section class="full-width navLateral parte02">
		<div class="full-width navLateral-bg btn-menu"></div>
		<div class="full-width navLateral-body">
			<div class="full-width navLateral-body-logo text-center tittles">
				<a href="Inicio.html"><img class="logo" src="img/iluminarte.png" alt="logo"></a> 
			</div>
			<figure class="full-width" style="height: 77px;">
				<div class="navLateral-body-cl">
					<img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
				</div>
				<figcaption class="navLateral-body-cr hide-on-tablet">
					<span>${usua.getNombreUsuario()} ${usua.getApellidoUsuario()}<br>
						<small> ${usua.idRolFK.nombreRol} </small>
					</span>
				</figcaption>
				<a rol="button" href="UsuarioController?accion=abrirchangepass" class="btn btn-success btn-sm" >Cambiar Password</a>
				<a rol="button" href="UsuarioController?accion=verPerfil" class="btn btn-success btn-sm" >Ver Perfil</a>
			</figure>
			<br>
			<br>
			<br>
			<div class="full-width tittles navLateral-body-tittle-menu">
				<i class="zmdi zmdi-desktop-mac"></i><span class="hide-on-tablet">&nbsp; DASHBOARD</span>
			</div>
			<nav class="full-width">
				<ul class="full-width list-unstyle menu-principal">
					<li class="full-width">
						<a href="InicioController?accion=abrirForm" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-store"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								INICIO
							</div>
						</a>
					</li>
					
					<li class="full-width" <c:if test="${usua.idRolFK.idRol!=1}"> hidden </c:if>>
						<a href="TipoRolController?accion=listarRoles" class="full-width">
							<div class="navLateral-body-cl">
								<i class="bi bi-shield-fill-check"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								ROLES
							</div>
						</a>
					</li>
					
					<li class="full-width" <c:if test="${usua.idRolFK.idRol==3}"> hidden </c:if>>
						<a href="CategoriaController?accion=listarCategoria" class="full-width">
							<div class="navLateral-body-cl">
								<i class="bi bi-bookmark"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								CATEGORIAS
							</div>
						</a>
					</li>
					
					<li class="full-width" <c:if test="${usua.idRolFK.idRol==3}"> hidden </c:if>>
						<a href="ProveedorController?accion=listarProveedor" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-assignment"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								PROVEEDOR
							</div>
						</a>
					</li>
										
					
					<li class="full-width" <c:if test="${usua.idRolFK.idRol==3}"> hidden </c:if>>
						<a href="UsuarioController?accion=listar" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-face"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								USUARIOS
							</div>							
						</a>
						
						<li class="full-width divider-menu-h"></li>
					<li class="full-width" <c:if test="${usua.idRolFK.idRol==3}"> hidden </c:if>>
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-lamp"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								MODULO PRODUCTOS
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="ProductoController?accion=listar" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-plus-square"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										VER PRODUCTOS
									</div>
								</a>
							</li>
							
						</ul>
					</li>
<li class="full-width divider-menu-h"></li>
					<!--  test="${usua.idRolFK.idRol!=1 || usua.idRolFK.idRol!=2}"-->
					<li class="full-width" <c:if test="${usua.idRolFK.idRol==3}"> hidden </c:if>>
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-shopping-cart"></i>
							</div>
							<div class="navLateral-body-cr hide-on-tablet">
								VENTAS
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="VentasController?menu=NuevaVenta&accion=default" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-plus-square"></i>
									</div>
									<div class="navLateral-body-cr hide-on-tablet">
										REGISTRAR VENTA
									</div>
								</a>
							</li>

						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</section>
	
	</body>
</html> 

 <% 
  }else{
	  request.getRequestDispatcher("login.jsp").forward(request,response);
  }
  %>