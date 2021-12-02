package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pago;
import model.PagoDAO;

/**
 * Servlet implementation class Pago
 */
@WebServlet("/Pago")
public class PagoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagoController() {
        super(); 
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String opcion = request.getParameter("opcion");
		if (opcion.equals("crear")) {
			
			System.out.println("Usted a presionado la opcion crear");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("views/crearPago.jsp");
			requestDispatcher.forward(request, response);
			
		}else if (opcion.equals("listar")) {
			System.out.println("Usted a presionado la opcion listar");
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String opcion=request.getParameter("opcion");
		
		
		PagoDAO pagoDAO = new PagoDAO();
		Pago pago= new Pago();
		pago.setEstadoPago(request.getParameter("estado"));
		pago.setTipoPago(request.getParameter("tipo"));
		pago.setValorPago(Double.parseDouble(request.getParameter("valor")));
		pago.setPocentajeIvaPago(Double.parseDouble(request.getParameter("porcentaje")));
		
		try {
			pagoDAO.guardar(pago);
			System.out.println("Registro guardado satisfactoriamente...");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//doGet(request, response);
	}

}
