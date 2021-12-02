package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Proveedor;
import model.ProveedorDAO;


/**
 * Servlet implementation class Proveedor
 */
@WebServlet("/ProveedorController")
public class ProveedorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProveedorController() {
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
                   
                    case "listarProveedor":
                    	listarProveedor(request, response);
                        break;
                    case "abrirForm":
                    	abrirForm(request,response);
                    	break;
                    case "addProveedor":
                    	addProveedor(request,response);
                    	break;
                    case "eliminar":
                    	eliminar(request,response);
                    	break;
                    case "verProveedor":
                    	verProveedor(request,response);
                    break;
                    case "editProveedor":
                    	editProveedor(request,response);
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
		private void listarProveedor(HttpServletRequest request, HttpServletResponse response) {
	        ProveedorDAO rdao = new ProveedorDAO();
	        
	        try{
	            List proveedor =rdao.listarProveedor();
	            request.setAttribute("proveedores", proveedor);
	            request.getRequestDispatcher("views/proveedor.jsp").forward(request, response);
	            System.out.println("Proveedores encontrados");
	        }catch(Exception e){
	            request.setAttribute("msje", "No se pudo listar los proveedores" + e.getMessage());
	            System.out.println("No se pueden listar los roles de proveedores" + e.getMessage());
	        }finally{
	            rdao = null;
	        }
		}
		
		private void abrirForm(HttpServletRequest request, HttpServletResponse response) {
	        
	        try{
	            request.getRequestDispatcher("views/proveedor-add.jsp").forward(request, response);
	            System.out.println("formulario abierto");
	        }catch(Exception e){
	            request.setAttribute("msje", "No se pudo abrir el formulario" + e.getMessage());
	            System.out.println("No se pudo abrir el formulario" + e.getMessage());
	        }finally{
	            
	        }
		}
		
		
		private void addProveedor(HttpServletRequest request, HttpServletResponse response) {
	        ProveedorDAO rdao=new ProveedorDAO();
	        Proveedor r=new Proveedor();
	        if(request.getParameter("nombre")!=null) {
	        	r.setNombreProveedor(request.getParameter("nombre"));
	        }
	        if(request.getParameter("direccion")!=null) {
	        	r.setDireccionProveedor(request.getParameter("direccion"));
	        }
	        
	        if(request.getParameter("telefono")!=null) {
	        	r.setTelefonoProveedor(request.getParameter("telefono"));
	        }
	        
	        if(request.getParameter("persona")!=null) {
	        	r.setPersonaContactoProveedor(request.getParameter("persona"));
	        }	
	        
	        if(request.getParameter("chkEstado")!=null) {
	        	r.setEstadoProveedor(true);
	        }
	        else {
	        	r.setEstadoProveedor(false);
	        }
	        try{
	        	rdao.registrarProveedor(r);
	            //request.getRequestDispatcher("views/role.jsp").forward(request, response);
	            response.sendRedirect("ProveedorController?accion=listarProveedor");
	        	System.out.println("Proveedor Registrado");
	        }catch(Exception e){
	            request.setAttribute("msje", "No se pudo registrar el proveedor" + e.getMessage());
	            System.out.println("No se pudo registrar el proveedor" + e.getMessage());
	        }finally{
	            
	        }
		}
		
		
		private void eliminar(HttpServletRequest request, HttpServletResponse response) {
			ProveedorDAO rdao=new ProveedorDAO();
	        Proveedor r=new Proveedor();
	        if(request.getParameter("id")!=null) {
	        	r.setIdProveedor(Integer.parseInt(request.getParameter("id")));
	        }
	        try{
	        	rdao.eliminarProveedor(r.getIdProveedor());
	            //request.getRequestDispatcher("views/role-edit.jsp").forward(request, response);
	        	response.sendRedirect("ProveedorController?accion=listarProveedor");
	        	System.out.println("Proveedor Eliminado");
	        }catch(Exception e){
	            request.setAttribute("msje", "No se pudo eliminar el registro" + e.getMessage());
	            System.out.println("No se pudo eliminar el registro" + e.getMessage());
	        }finally{
	            
	        }
		}	
		
		private void verProveedor(HttpServletRequest request, HttpServletResponse response) {
		
			ProveedorDAO rdao=new ProveedorDAO();
			Proveedor r=new Proveedor();
			
			int id=Integer.parseInt(request.getParameter("id"));
			
			try {
				r=rdao.consultaporIdProveedor(id);
				request.setAttribute("proveedor", r);
				request.getRequestDispatcher("views/proveedor-edit.jsp").forward(request, response);
				System.out.println("Proveedor encontrado");
				
			}catch(Exception e) {
				System.out.println("Proveedor NO encontrado "+e.getMessage());
			}
			finally {
				rdao=null;
			}
		}
		
		private void editProveedor(HttpServletRequest request, HttpServletResponse response) {
			ProveedorDAO rdao=new ProveedorDAO();
			Proveedor r=new Proveedor();
			
			if(request.getParameter("id")!=null &&  request.getParameter("nombre")!=null && request.getParameter("direccion")!=null && request.getParameter("telefono")!=null && request.getParameter("persona")!=null && request.getParameter("chkEstado")!=null ) {
	        	r.setIdProveedor(Integer.parseInt(request.getParameter("id")));
				r.setNombreProveedor(request.getParameter("nombre"));
				r.setDireccionProveedor(request.getParameter("direccion"));
				r.setTelefonoProveedor(request.getParameter("telefono"));
				r.setPersonaContactoProveedor(request.getParameter("persona"));
	
	        }
	        if(request.getParameter("chkEstado")!=null) {
	        	r.setEstadoProveedor(true);
	        }
	        else {
	        	r.setEstadoProveedor(false);
	        }
			try {
				rdao.actualizarProveedor(r);
				response.sendRedirect("ProveedorController?accion=listarProveedor");
				
				
			}catch(Exception e) {
				System.out.println("Proveedor NO actualizado "+e.getMessage());
			}
			
		}
		
		private void changeEstado(HttpServletRequest request, HttpServletResponse response) {
			ProveedorDAO rdao=new ProveedorDAO();
			Proveedor r=new Proveedor();
			try {
				r.setIdProveedor(Integer.parseInt(request.getParameter("id")));
				r.setEstadoProveedor(Boolean.parseBoolean(request.getParameter("es")));
				
				rdao.cambiarEstado(r);
				response.sendRedirect("ProveedorController?accion=listarProveedor");
			}catch(Exception e) {
				System.out.println("Estado NO actualizado "+e.getMessage());
			}
		}
	}
