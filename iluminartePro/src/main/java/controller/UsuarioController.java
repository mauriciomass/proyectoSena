package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.TipoRol;
import model.TipoRolDAO;

import model.TipoDocumento;
import model.TipoDocumentoDAO;

import model.Usuario;
import model.UsuarioDAO;




/**
 * Servlet implementation class Usuario
 */
@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Usuario u=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String accion = request.getParameter("accion");
		
		//Crear la sesion
		HttpSession session=request.getSession();
		
		
        try {
            if (accion != null) {
                switch (accion) {
                   
                	case "abrirLogin":
                		abrirLogin(request,response);
                		break;
                	case "login":
                		u.setCorreoUsuario(request.getParameter("correo"));
                		u.setContrasenaUsuario(ud.MD5(request.getParameter("password")));
                		try {
                			u=ud.validarUsuario(u.getCorreoUsuario(), u.getContrasenaUsuario());
                			if(u.getCorreoUsuario()!=null && u.isEstadoUsuario()==true) {
                				System.out.println("El DAO encontró el usuario y está activo.");
                				session.setAttribute("usua", u);
                				response.sendRedirect("UsuarioController?accion=listar");
                			}else if(u.getCorreoUsuario()!=null && u.isEstadoUsuario()==false) {
                				System.out.println("El DAO encontró el usuario y está inactivo.");
                				request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=Usuario inactivo, por favor consulte al administrador.").forward(request, response);
                			}else {
                				System.out.println("El DAO no encontró el usuario y está inactivo.");
                				request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=Datos de acceso incorrectos.").forward(request, response);                				
                			}
                		}catch (Exception ex) {
                            System.out.println("Error" + ex.getMessage());
                        }
                		break;
                	case "logout":
                		session.removeAttribute("user");
                		session.invalidate();
                		request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=Sesión Finalizada").forward(request, response);
                	case "abrirchangepass":
                		abrirchangepass(request, response);
                		break;
                	case "changePassword":
                		changePassword(request, response);
                		break;
                	case "verPerfil":
                		verPerfil(request, response);
                		break;
                    case "listar":
                        listar(request, response);
                        break;
                    case "abrirForm":
                    	abrirForm(request,response);
                    	break;
                    case "add":
                    	add(request,response);
                    	break;
                    case "eliminar":
                    	eliminar(request,response);
                    	break;
                    case "ver":
                    	ver(request,response);
                    break;
                    case "edit":
                    	edit(request,response);
                    break;
                    case "validarCorreo":
                    	validarCorreo(request,response);
                    break;
                    case "changeEstado":
                    	changeEstado(request,response);
                    break;
          	                    
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            try {
                request.getRequestDispatcher("/mensaje.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void abrirLogin(HttpServletRequest request, HttpServletResponse response) {
        
        try{
            request.getRequestDispatcher("login.jsp").forward(request, response);
            System.out.println("Login abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el login" + e.getMessage());
            System.out.println("No se pudo abrir el login" + e.getMessage());
        }finally{
            
        }
	}
	
	private void abrirchangepass(HttpServletRequest request, HttpServletResponse response) {
        
        try{
            request.getRequestDispatcher("views/changePass.jsp").forward(request, response);
            System.out.println("Cambio de Password Abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el Cambio de Password" + e.getMessage());
            System.out.println("No se pudo abrir el Cambio de Password" + e.getMessage());
        }finally{
            
        }
	}
	
	private void verPerfil(HttpServletRequest request, HttpServletResponse response) {
	
		 System.out.println("tipodocumento");
        try{   		
        	this.obtenerTiposDocumentos(request);
            request.getRequestDispatcher("views/usuario-perfil.jsp").forward(request, response);
            System.out.println("Perfil abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el perfil" + e.getMessage());
            System.out.println("No se pudo abrir el perfil" + e.getMessage());
        }finally{
            
        }
	}


	private void listar(HttpServletRequest request, HttpServletResponse response) {
  
        
        try{
        	List usu=ud.Listar();
            request.setAttribute("user", usu);
            request.getRequestDispatcher("views/usuario.jsp").forward(request, response);
            System.out.println("Usuarios encontrados");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo listar los usuarios" + e.getMessage());
            System.out.println("No se pueden listar los usuarios" + e.getMessage());
        }finally{
        	//ud=null;
        }
	}
	
private void abrirForm(HttpServletRequest request, HttpServletResponse response) {
        
        try{
        	this.obtenerRoles(request);
        	this.obtenerTiposDocumentos(request);
            request.getRequestDispatcher("views/usuario-add.jsp").forward(request, response);
            System.out.println("formulario abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el formulario" + e.getMessage());
            System.out.println("No se pudo abrir el formulario" + e.getMessage());
        }finally{
            
        }
	}

private void obtenerTiposDocumentos(HttpServletRequest request) {
	TipoDocumentoDAO rdao=new TipoDocumentoDAO();
    List<TipoDocumento> tip = null;
    try {
        tip = rdao.listarTipoDocumentos();
        request.setAttribute("tip", tip);
    } catch (Exception e) {
        request.setAttribute("msje", "No se pudo cargar los cargos :( " + e.getMessage());
    } finally {
       // rdao=null;
    }
}

private void obtenerRoles(HttpServletRequest request) {
	TipoRolDAO rdao=new TipoRolDAO();
    List<TipoRol> rol = null;
    try {
        rol = rdao.listarRoles();
        request.setAttribute("roles", rol);
    } catch (Exception e) {
        request.setAttribute("msje", "No se pudo cargar los cargos :( " + e.getMessage());
    } finally {
        //rdao=null;
    }
}

private void add(HttpServletRequest request, HttpServletResponse response) {
	   
    if(request.getParameter("tipodocumento")!=null && request.getParameter("tiporol")!=null && request.getParameter("nombre")!=null && 
       request.getParameter("apellido")!=null && request.getParameter("contrasena")!=null && request.getParameter("numero")!=null &&
       request.getParameter("direccion")!=null && request.getParameter("telefono")!=null && request.getParameter("correo")!=null ) {
       	TipoDocumento r = new TipoDocumento();
        r.setIdTipoDocumento(Integer.parseInt(request.getParameter("tipodocumento")));
        u.setIdTipodeDocumentoFK(r);
        
    	TipoRol tr = new TipoRol();
    	tr.setIdRol(Integer.parseInt(request.getParameter("tiporol")));
        u.setIdRolFK(tr);        
        
    	u.setNombreUsuario(request.getParameter("nombre"));    	
    	u.setApellidoUsuario(request.getParameter("apellido"));
    	u.setContrasenaUsuario(ud.MD5(request.getParameter("contrasena")));
    	u.setNumerodeIdentificacionUsuario(request.getParameter("numero"));
    	u.setDireccionUsuario(request.getParameter("direccion"));
    	u.setTelefonoUsuario(request.getParameter("telefono"));
    	u.setCorreoUsuario(request.getParameter("correo"));

    	
    }
    if(request.getParameter("chkEstado")!=null) {
    	u.setEstadoUsuario(true);
    }
    else {
    	u.setEstadoUsuario(false);
    }
    try{
    	ud.registrar(u);
        //request.getRequestDispatcher("views/role.jsp").forward(request, response);
        response.sendRedirect("UsuarioController?accion=listar");
    	System.out.println("Usuario Registrado");
    }catch(Exception e){
        request.setAttribute("msje", "No se pudo registrar el usuario controller" + e.getMessage());
        System.out.println("No se pudo registrar el usuario controller" + e.getMessage());
    }finally{
    	//ud=null;
    }
}

private void eliminar(HttpServletRequest request, HttpServletResponse response) {
	
    if(request.getParameter("id")!=null) {
    	u.setIdUsuario(Integer.parseInt(request.getParameter("id")));
    }
    try{
    	ud.eliminar(u.getIdUsuario());
        //request.getRequestDispatcher("views/role-edit.jsp").forward(request, response);
    	response.sendRedirect("UsuarioController?accion=listar");
    	System.out.println("Usuario Eliminado");
    }catch(Exception e){
        request.setAttribute("msje", "No se pudo eliminar el registro" + e.getMessage());
        System.out.println("No se pudo eliminar el registro" + e.getMessage());
    }finally{
    	//ud=null;
    }
}

private void ver(HttpServletRequest request, HttpServletResponse response) {
	
	int id=Integer.parseInt(request.getParameter("id"));
	
	try {
		this.obtenerRoles(request);
		this.obtenerTiposDocumentos(request);
		u=ud.consultaporId(id);
		request.setAttribute("user", u);
		request.getRequestDispatcher("views/usuario-edit.jsp").forward(request, response);
		System.out.println("Usuario encontrado "+id);
		
	}catch(Exception e) {
		System.out.println("Usuario NO encontrado "+e.getMessage());
	}
	finally {
		//ud=null;
	}
}

private void edit(HttpServletRequest request, HttpServletResponse response) {
	
	if(request.getParameter("id")!=null &&  request.getParameter("tipodocumento")!=null && request.getParameter("tiporol")!=null && request.getParameter("nombre")!=null && 
	   request.getParameter("apellido")!=null && request.getParameter("contrasena")!=null && request.getParameter("numero")!=null &&
	   request.getParameter("direccion")!=null && request.getParameter("telefono")!=null && request.getParameter("correo")!=null ) {
		
		u.setIdUsuario(Integer.parseInt(request.getParameter("id")));
		
		TipoDocumento r = new TipoDocumento();
        r.setIdTipoDocumento(Integer.parseInt(request.getParameter("tipodocumento")));
        u.setIdTipodeDocumentoFK(r);
        
    	TipoRol tr = new TipoRol();
    	tr.setIdRol(Integer.parseInt(request.getParameter("tiporol")));
        u.setIdRolFK(tr);
        
    	u.setNombreUsuario(request.getParameter("nombre"));    	
    	u.setApellidoUsuario(request.getParameter("apellido"));
    	u.setContrasenaUsuario(request.getParameter("contrasena"));
    	u.setNumerodeIdentificacionUsuario(request.getParameter("numero"));
    	u.setDireccionUsuario(request.getParameter("direccion"));
    	u.setTelefonoUsuario(request.getParameter("telefono"));
    	u.setCorreoUsuario(request.getParameter("correo"));
 
    }
    if(request.getParameter("chkEstado")!=null) {
    	u.setEstadoUsuario(true);
    }
    else {
    	u.setEstadoUsuario(false);
    }
	try {
		ud.actualizar(u);
		response.sendRedirect("UsuarioController?accion=listar");
		
		
	}catch(Exception e) {
		System.out.println("Usuario NO actualizado "+e.getMessage());
	}

	
}

private void changePassword(HttpServletRequest request, HttpServletResponse response) {
	
	if(request.getParameter("id")!=null &&  request.getParameter("passnew")!=null) {
		
		u.setIdUsuario(Integer.parseInt(request.getParameter("id")));
		
		u.setContrasenaUsuario(request.getParameter("passnew"));
    	
    }

	try {
		ud.changePassword(u);
		response.sendRedirect("UsuarioController?accion=logout");
		
		
	}catch(Exception e) {
		System.out.println("Contraseña NO actualizada "+e.getMessage());
	}

	
}


private void changeEstado(HttpServletRequest request, HttpServletResponse response) {
	
	Boolean es = Boolean.parseBoolean(request.getParameter("es"));
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	System.out.println("Se entro al metodo changeEstado" + es + id);
	
	
	try {
		
		
		ud.cambiarEstado(es,id);
		response.sendRedirect("UsuarioController?accion=listar");
	}catch(Exception e) {
		System.out.println("Estado NO actualizado "+e.getMessage());
	}
 }


private void validarCorreo(HttpServletRequest request, HttpServletResponse response) throws IOException {
    
	response.setContentType("text/html;charset=iso-8859-1");
	PrintWriter out=response.getWriter();
	
	 
	
    try{
        int cant=ud.validarCorreo(request.getParameter("correo"));
        System.out.println("Entro por validar correo "+cant);
        
        if(cant!=0) {
        	System.out.println("El correo ya está registrado");
        	out.println("El correo ya está registrado");
        }else {
        	System.out.println("Se ha validado su correo puede continuar con el registro");
        }
        
        
    }catch(Exception e){
        
        System.out.println("No se pudo abrir el Cambio de Password" + e.getMessage());
    }finally{
        
    }
}

}
