package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TipoRolDAO;

/**
 * Servlet implementation class InicioController
 */
@WebServlet("/InicioController")
public class InicioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioController() {
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
                   
                    case "abrirForm":
                    	abrirForm(request, response);
                        break;
                                       
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            try {
                request.getRequestDispatcher("login.jsp").forward(request, response);

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
	
	private void abrirForm(HttpServletRequest request, HttpServletResponse response) {
        
        try{
            request.getRequestDispatcher("views/inicio-count.jsp").forward(request, response);
            //response.sendRedirect("views/inicio-count.jsp");
            System.out.println("Abrir formulario");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir" + e.getMessage());
            System.out.println("No se pueden abrir" + e.getMessage());
        }finally{
           
        }
	}

}
