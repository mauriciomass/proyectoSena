package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TipoRol;
import model.TipoRolDAO;

/**
 * Servlet implementation class RolController
 */
@WebServlet("/TipoRolController")
public class TipoRolController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TipoRolDAO rdao=new TipoRolDAO();
	TipoRol r=new TipoRol();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipoRolController() {
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
        try {
            if (accion != null) {
                switch (accion) {
                   
                    case "listarRoles":
                        listarRoles(request, response);
                        break;
                    case "abrirForm":
                    	abrirForm(request,response);
                    	break;
                    case "addRol":
                    	addRol(request,response);
                    	break;
                    case "eliminar":
                    	eliminar(request,response);
                    	break;
                    case "verRol":
                    	verRol(request,response);
                    break;
                    case "editRol":
                    	editRol(request,response);
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
	
	private void listarRoles(HttpServletRequest request, HttpServletResponse response) {
        TipoRolDAO rdao = new TipoRolDAO();
        
        try{
            List rol = rdao.listarRoles();
            request.setAttribute("roles", rol);
            request.getRequestDispatcher("views/role.jsp").forward(request, response);
            System.out.println("Roles encontrados");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo listar los usuarios" + e.getMessage());
            System.out.println("No se pueden listar los roles de usuario" + e.getMessage());
        }finally{
            rdao = null;
        }
	}
	
	private void abrirForm(HttpServletRequest request, HttpServletResponse response) {
        
        try{
            request.getRequestDispatcher("views/role-add.jsp").forward(request, response);
            System.out.println("formulario abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el formulario" + e.getMessage());
            System.out.println("No se pudo abrir el formulario" + e.getMessage());
        }finally{
            
        }
	}
	
	
	private void addRol(HttpServletRequest request, HttpServletResponse response) {
        TipoRolDAO rdao=new TipoRolDAO();
        TipoRol r=new TipoRol();
        if(request.getParameter("nombre")!=null) {
        	r.setNombreRol(request.getParameter("nombre"));
        }
        if(request.getParameter("chkEstado")!=null) {
        	r.setEstadoRol(true);
        }
        else {
        	r.setEstadoRol(false);
        }
        try{
        	rdao.registrarRol(r);
            //request.getRequestDispatcher("views/role.jsp").forward(request, response);
            response.sendRedirect("TipoRolController?accion=listarRoles");
        	System.out.println("Rol Registrado");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo registrar el rol" + e.getMessage());
            System.out.println("No se pudo registrar el rol" + e.getMessage());
        }finally{
            
        }
	}
	
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		TipoRolDAO rdao=new TipoRolDAO();
        TipoRol r=new TipoRol();
        if(request.getParameter("id")!=null) {
        	r.setIdRol(Integer.parseInt(request.getParameter("id")));
        }
        try{
        	rdao.eliminarRol(r.getIdRol());
            //request.getRequestDispatcher("views/role-edit.jsp").forward(request, response);
        	response.sendRedirect("TipoRolController?accion=listarRoles");
        	System.out.println("Rol Eliminado");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo eliminar el registro" + e.getMessage());
            System.out.println("No se pudo eliminar el registro" + e.getMessage());
        }finally{
            
        }
	}	
	
	private void verRol(HttpServletRequest request, HttpServletResponse response) {
	
		TipoRolDAO rdao=new TipoRolDAO();
		TipoRol r=new TipoRol();
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		try {
			r=rdao.consultaporId(id);
			request.setAttribute("tiporol", r);
			request.getRequestDispatcher("views/role-edit.jsp").forward(request, response);
			System.out.println("Rol encontrado");
			
		}catch(Exception e) {
			System.out.println("Rol NO encontrado "+e.getMessage());
		}
		finally {
			rdao=null;
		}
	}
	
	private void editRol(HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getParameter("id")!=null &&  request.getParameter("nombre")!=null) {
        	r.setIdRol(Integer.parseInt(request.getParameter("id")));
			r.setNombreRol(request.getParameter("nombre"));
        }
        if(request.getParameter("chkEstado")!=null) {
        	r.setEstadoRol(true);
        }
        else {
        	r.setEstadoRol(false);
        }
		try {
			rdao.actualizarRol(r);
			response.sendRedirect("TipoRolController?accion=listarRoles");
			
			
		}catch(Exception e) {
			System.out.println("Rol NO actualizado "+e.getMessage());
		}
		
	}
	
	private void changeEstado(HttpServletRequest request, HttpServletResponse response) {
		try {
			r.setIdRol(Integer.parseInt(request.getParameter("id")));
			r.setEstadoRol(Boolean.parseBoolean(request.getParameter("es")));
			
			rdao.cambiarEstado(r);
			response.sendRedirect("TipoRolController?accion=listarRoles");
		}catch(Exception e) {
			System.out.println("Estado NO actualizado "+e.getMessage());
		}
	}
}