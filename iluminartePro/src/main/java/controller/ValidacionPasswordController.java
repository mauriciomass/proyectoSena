package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.Security;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Configmail;
import model.TipoRol;
import model.TipoRolDAO;
import model.Usuario;
import model.UsuarioDAO;
import model.ValidationPasswordDAO;
import model.encoder;

/**
 * Servlet implementation class ValidacionPassword
 */
@WebServlet("/ValidacionPasswordController")
public class ValidacionPasswordController extends HttpServlet {
	
	
	
	
	private static final long serialVersionUID = 1L;
	
	Usuario u=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
	
	ValidationPasswordDAO p=new ValidationPasswordDAO();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidacionPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }
    


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//response.getWriter().write(request.getParameter("enl"));
		
		
		
		//Crear la sesion
		
		HttpSession session=request.getSession();
		
		
		String enlace = request.getParameter("enl");
		
		System.out.println("El enlace es " + enlace);
		
    	String [] accionPartes = enlace.split("@");
    	    	
    	
    	
    	if(enlace!=null) {
    	
    	String accion2 ="KeyChange";
    	
    	try {
    		if(accion2 !=null) {
    			switch (accion2) {
		        	case "KeyChange":
		        		System.out.println("entro a abrir Password numero de partes " + accionPartes.length); 
				           	 if(accionPartes.length > 1) {
				           		 System.out.println("Partes 1: " + accionPartes[0]);
				           		 System.out.println("Partes 2: " + accionPartes[1]);
				           		 System.out.println("Partes 3: " + accionPartes[2]);
				           		 KeyChange(request, response,accionPartes[0],accionPartes[1],accionPartes[2]);
				                 System.out.println("KeyChange");
				                 enlace = null;
				                 
				           	 }
		        		break;
                	default:
                		request.getRequestDispatcher("views/validationPassword.jsp").forward(request, response);
                  }
    		
    		}
    			
    	} catch (Exception e) {
            try {
            	request.getRequestDispatcher("views/validationPassword.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
          }
    	}

       		
	}
	
	
	
    /*public static Date ParseFecha(String fecha)
    {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaDate = null;
        try {
            fechaDate = formato.parse(fecha);
        } 
        catch (ParseException ex) 
        {
            System.out.println(ex);
        }
        return fechaDate;
    }*/
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);		
		
	}
	
	
	private void KeyChange(HttpServletRequest request, HttpServletResponse response,String Parte1,String Parte2,String Parte3) {
  
		HttpSession session=request.getSession();
        try{
        	String string1 = Parte1;
        	
        	System.out.println("Parte 1 " + string1);
        	
        	String string2 = Parte2;
        	
        	System.out.println("Parte 2 " + string2);
        	
        	String string3 = Parte3;
        	
        	System.out.println("Parte 3 " + string3);
   	
        	encoder dEncryption = new encoder();
        	
        	
        	String secretKey = "Agarez1";
        	String dencryptedCode1 = dEncryption.deEncryptCode(secretKey,string1);
        	System.out.println("Desencriptado parte 1: " + dencryptedCode1);
        	
        	String dencryptedCode2 = dEncryption.deEncryptCode(secretKey,string2);
        	System.out.println("Desencriptado parte 2: " + dencryptedCode2);
        	
        	System.out.println("Desencriptado parte 3: " + string3);
        	
			LocalDateTime dateTime = LocalDateTime.now(); 
			
		    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		    
		    String currentTime = dateTime.format(myFormatObj);  
			
			System.out.println("Fecha: " + currentTime);
        	
 
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            
		    Date fechaInicial=dateFormat.parse(dencryptedCode1);
			Date fechaFinal=dateFormat.parse(currentTime);
	
			int dias=(int) ((fechaFinal.getTime()-fechaInicial.getTime())/86400000);
	
			System.out.println("Hay "+dias+" dias de diferencia");
			
			        	
        	u.setCorreoUsuario(dencryptedCode2);
    		u.setContrasenaUsuario(ud.MD5(string3));
        	
        	
        	
    		
    		u=p.consultarUsuCorreo(dencryptedCode2);
			if(u.getCorreoUsuario()!=null && u.isEstadoUsuario()==true) {
				System.out.println("El DAO encontró el usuario y está activo.");
				session.setAttribute("usuaval", u);
				
				
				request.getSession().setAttribute("usupass",string3);
				request.getSession().setAttribute("usudias",dias);
				//request.getRequestDispatcher("views/validationPassword.jsp").forward(request, response);
				response.sendRedirect("ValidacionPasswordDosController?accion=abrirPassword");
				
			   }

			
            System.out.println("Desencriptado");
        }catch(Exception e){
            request.setAttribute("msje", "No se puede determinar el usuario " + e.getMessage());
            System.out.println("No se puede determinar el usuario " + e.getMessage());
        }
	}
	
		


}
