package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Categoria;
import model.CategoriaDAO;

/**
 * Servlet implementation class Categoria
 */
@WebServlet("/CategoriaController")
public class CategoriaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoriaController() {
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
                   
                    case "listarCategoria":
                    	listarCategoria(request, response);
                        break;
                    case "abrirForm":
                    	abrirForm(request,response);
                    	break;
                    case "addCategoria":
                    	addCategoria(request,response);
                    	break;
                    case "eliminar":
                    	eliminar(request,response);
                    	break;
                    case "verCategoria":
                    	verCategoria(request,response);
                    break;
                    case "editCategoria":
                    	editCategoria(request,response);
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
	
	private void listarCategoria(HttpServletRequest request, HttpServletResponse response) {
        CategoriaDAO rdao = new CategoriaDAO();
        
        try{
            List categoria =rdao.listarCategoria();
            request.setAttribute("categorias", categoria);
            request.getRequestDispatcher("views/categoria.jsp").forward(request, response);
            System.out.println("Categoria encontradas");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo listar las categorias" + e.getMessage());
            System.out.println("No se pueden listar los roles de las categorias" + e.getMessage());
        }finally{
            rdao = null;
        }
	}
	
	private void abrirForm(HttpServletRequest request, HttpServletResponse response) {
        
        try{
            request.getRequestDispatcher("views/categoria-add.jsp").forward(request, response);
            System.out.println("formulario abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el formulario" + e.getMessage());
            System.out.println("No se pudo abrir el formulario" + e.getMessage());
        }finally{
            
        }
	}
	
	
	private void addCategoria(HttpServletRequest request, HttpServletResponse response) {
        CategoriaDAO rdao=new CategoriaDAO();
        Categoria r=new Categoria();
        if(request.getParameter("nombre")!=null) {
        	r.setNombreCategoria(request.getParameter("nombre"));
        }
        if(request.getParameter("descripcion")!=null) {
        	r.setDescripcionCategoria(request.getParameter("descripcion"));
        }
        
        if(request.getParameter("chkEstado")!=null) {
        	r.setEstadoCategoria(true);
        }
        else {
        	r.setEstadoCategoria(false);
        }
        try{
        	rdao.registrarCategoria(r);
            //request.getRequestDispatcher("views/role.jsp").forward(request, response);
            response.sendRedirect("CategoriaController?accion=listarCategoria");
        	System.out.println("Categoria Registrada");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo registrar la categoria" + e.getMessage());
            System.out.println("No se pudo registrar la categoria" + e.getMessage());
        }finally{
            
        }
	}
	
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		CategoriaDAO rdao=new CategoriaDAO();
        Categoria r=new Categoria();
        if(request.getParameter("id")!=null) {
        	r.setIdCategoria(Integer.parseInt(request.getParameter("id")));
        }
        try{
        	rdao.eliminarCategoria(r.getIdCategoria());
            //request.getRequestDispatcher("views/role-edit.jsp").forward(request, response);
        	response.sendRedirect("CategoriaController?accion=listarCategoria");
        	System.out.println("Categoria Eliminado");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo eliminar el registro" + e.getMessage());
            System.out.println("No se pudo eliminar el registro" + e.getMessage());
        }finally{
            
        }
	}	
	
	private void verCategoria(HttpServletRequest request, HttpServletResponse response) {
	
		CategoriaDAO rdao=new CategoriaDAO();
		Categoria r=new Categoria();
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		try {
			r=rdao.consultaporIdCategoria(id);
			request.setAttribute("categoria", r);
			request.getRequestDispatcher("views/categoria-edit.jsp").forward(request, response);
			System.out.println("Categoria encontrada");
			
		}catch(Exception e) {
			System.out.println("Categoria NO encontrada "+e.getMessage());
		}
		finally {
			rdao=null;
		}
	}
	
	private void editCategoria(HttpServletRequest request, HttpServletResponse response) {
		CategoriaDAO rdao=new CategoriaDAO();
		Categoria r=new Categoria();
		
		if(request.getParameter("id")!=null &&  request.getParameter("nombre")!=null && request.getParameter("chkEstado")!=null ) {
        	r.setIdCategoria(Integer.parseInt(request.getParameter("id")));
			r.setNombreCategoria(request.getParameter("nombre"));
			r.setDescripcionCategoria(request.getParameter("descripcion"));
		
        }
        if(request.getParameter("chkEstado")!=null) {
        	r.setEstadoCategoria(true);
        }
        else {
        	r.setEstadoCategoria(false);
        }
		try {
			rdao.actualizarCategoria(r);
			response.sendRedirect("CategoriaController?accion=listarCategoria");
			
			
		}catch(Exception e) {
			System.out.println("Categoria NO actualizado "+e.getMessage());
		}
		
	}
	
	private void changeEstado(HttpServletRequest request, HttpServletResponse response) {
		CategoriaDAO rdao=new CategoriaDAO();
		Categoria r=new Categoria();
		try {
			r.setIdCategoria(Integer.parseInt(request.getParameter("id")));
			r.setEstadoCategoria(Boolean.parseBoolean(request.getParameter("es")));
			
			rdao.cambiarEstado(r);
			response.sendRedirect("CategoriaController?accion=listarCategoria");
		}catch(Exception e) {
			System.out.println("Estado NO actualizado "+e.getMessage());
		}
	}
}

