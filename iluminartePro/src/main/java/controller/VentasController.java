

package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.Usuario;
import model.UsuarioDAO;

/**
 * Servlet implementation class Ventas
 */
@WebServlet("/VentasController")
public class VentasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Usuario u=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VentasController() {
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
		
		System.out.println("la accion entró a ventas controller");
		

            if (accion.equals("NuevaVenta")) {
                switch (accion) {
                
                case "BuscarCliente":
                	String numi=request.getParameter("codigocliente");
                	u.setNumerodeIdentificacionUsuario(numi);
                	Usuario c = null;
					try {
						c = ud.buscar(numi);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                	request.setAttribute("c",c);
                	               	
                	             	
                	System.out.println("Usuario buscado");
                	break;
                default:
                	System.out.println("No busco cliente");
                    request.getRequestDispatcher("views/venta.jsp").forward(request, response);             	
                
                
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

}
