package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Configmail;
import model.Usuario;
import model.UsuarioDAO;
import model.ValidationPasswordDAO;
import model.encoder;

/**
 * Servlet implementation class ForgetPasswordController
 */
@WebServlet("/ForgetPasswordController")
public class ForgetPasswordController extends HttpServlet {
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
			Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
	
	
	public static final Pattern VALID_PASSWORD_REGEX = 
			Pattern.compile("^.*(?=.{8,})(?=.*\\\\d)(?=.*[a-z])(?=.*[A-Z])(^[a-zA-Z0-9@\\\\$=!:.#%]+$)", Pattern.CASE_INSENSITIVE);
	
	
	private static final long serialVersionUID = 1L;
	
	Usuario u=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
	ValidationPasswordDAO p=new ValidationPasswordDAO();
	
	private String host;
	private String puerto;
	private String remitente;
	private String password;
	private boolean validForm;
       
    
	public void init() {
		ServletContext contexto=getServletContext();
		host=contexto.getInitParameter("host");
		puerto=contexto.getInitParameter("puerto");
		remitente=contexto.getInitParameter("remitente");
		password=contexto.getInitParameter("password");
		
	}
    
	public static boolean validarPassword(String datos) {
		
		return datos.matches("^.*(?=.{8,})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(^[a-zA-Z0-9@\\$=!:.#%]+$)");
	}
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPasswordController() {
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
	                
	                	case "abrirFormForgetPassword":
	                		abrirFormForgetPassword(request,response);
	                		break;
	                	case "valForgPass":
	                		valForgPass(request,response);                		  		   
	                		
	                		break;
	                	case "envioCorreo":
	                		envioCorreo(request,response);
	               		
	                		break;
	                	default:
	                        response.sendRedirect("UsuarioController?accion=abrirLogin");
	                  }
	                } else {
		                response.sendRedirect("UsuarioController?accion=abrirLogin");
		            }
		        } catch (Exception e) {
		            try {
		                request.getRequestDispatcher("UsuarioController?accion=abrirLogin").forward(request, response);
		
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
	
	private void envioCorreo(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
	    
		String destinatario=request.getParameter("correo");
		
		System.out.println("Entra por enviar correo de olvidar contraseña");
		
		if(destinatario!=null){
			
		 u=p.consultarUsuCorreo(destinatario);
			
		if(u.getCorreoUsuario()!=null && u.isEstadoUsuario()==true) {
			
		
			System.out.println("Usuario se encuentra activo");
			
			String nombreUsuario= u.getNombreUsuario();
	    	String apellidoUsuario = u.getApellidoUsuario();
	    	
	    	
	    	String valorClave=ud.claves_aleatorias();
	    	
	    	u.setIdUsuario(u.getIdUsuario());
			
			u.setContrasenaUsuario(ud.MD5(valorClave));
			
			ud.changePassword(u);
	    	
            LocalDateTime dateTime = LocalDateTime.now(); 
			
		    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		    
		    String currentTime = dateTime.format(myFormatObj);  

		    System.out.println("Fecha: " + currentTime);
			
			String urlString = "http://localhost:8080/iluminarteProRollBack/ValidacionPasswordController?method=KeyChange&enl=";
			String imgclick="<img width='150' height='100' src ='https://pagina-jesus-mass.s3.us-east-2.amazonaws.com/click.jpg'/>";
			encoder cEncryption = new encoder();
			String secretKey = "Agarez1";
			String encryptedCode1 = cEncryption.encryptCode(secretKey,currentTime);
			String encryptedCode2 = cEncryption.encryptCode(secretKey,destinatario);
			System.out.println("Encriptado 1: " + encryptedCode1);
			System.out.println("Encriptado 2: " + encryptedCode2);
			System.out.println("Encriptado 3: " + valorClave);
			String link = urlString + encryptedCode1 + "@" + encryptedCode2 + "@" + valorClave;
	    
		    
		    String asunto="BIENVENIDO A ILUMINARTE";
		    String cuerpo="<h1> Hola " + nombreUsuario + " " + apellidoUsuario + " Gracias por registrarse en Iluminarte </h1>"
		    		+ "<h2> Para cambiar su clave realice el siguiente paso: </h2>"
		    		+ "<br> <br>"
		    		+ " <h3> Para iniciar sesión debe cambiar la clave asignada , haz: </h3>"
		    		+ " <a href= " + link + ">" + imgclick + "</a>"
		    		+ "<br> <br>"
		    		+ " <img width='150' height='100' src ='https://pagina-jesus-mass.s3.us-east-2.amazonaws.com/iluminarte2.jpeg'/>";
		    		
		    try {
		    	//Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
		    	
		    	Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
		    	System.out.println("Se envió el mensaje al nuevo usuario");
		    	response.sendRedirect("login.jsp");
		    }catch(Exception e) {
		    	System.out.println("Se produjo un error al enviar el mensaje al nuevo usuario "+e.getMessage());
		    }
		}else {
			response.sendRedirect("ForgetPasswordController?accion=abrirFormForgetPassword");
		}    
	 }
  }



	private void abrirFormForgetPassword(HttpServletRequest request, HttpServletResponse response) {
	    
	    try{
	        request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
	        System.out.println("Abrir el cambio de password");
	    }catch(Exception e){
	        request.setAttribute("msje", "No se pudo abrir el cambio de password" + e.getMessage());
	        System.out.println("No se pudo abrir el cambio de password" + e.getMessage());
	    }
	}
	
	private void valForgPass(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		
	System.out.println("Ingresa por validacion de correo ForgetPassword");

	String correo=request.getParameter("correo");
	System.out.println("El correo es " + correo);
	
	if(correo!=null) {
	
	Matcher emailValidador = VALID_EMAIL_ADDRESS_REGEX.matcher(request.getParameter("correo"));
	
	
	  response.setContentType("text/html;charset=UTF-8");
	  PrintWriter out=response.getWriter();
	
	  
	  
	  int cant=ud.validarCorreo(request.getParameter("correo"));
	  
        if(!emailValidador.find() || correo==null || correo.isEmpty()) {
        	System.out.println("!El formato de correo no es válido¡");
        	out.print("false;correoforgpass;!El formato de correo no es válido¡");
        	return;
        }
        
        else if(cant == 0) {
        	System.out.println("!El correo no se encuentra registrado en nuestra base de datos¡");
        	out.print("false;correoexist;!El correo no se encuentra registrado en nuestra base de datos,por favor registrarse¡");
        	return;
        }	                			
		else{
			out.print("true;!Se ha verificado su correo correctamente¡");

			}             			
		
	 }
	else {
		request.getRequestDispatcher("views/forgetPassword.jsp").forward(request, response);
	}

	
   }

}
