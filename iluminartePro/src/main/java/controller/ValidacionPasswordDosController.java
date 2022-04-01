package controller;

import java.io.IOException;
import java.io.PrintWriter;
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


/**
 * Servlet implementation class ValidacionPasswordDosController
 */
@WebServlet("/ValidacionPasswordDosController")
public class ValidacionPasswordDosController extends HttpServlet {
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
			Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
	
	
	public static final Pattern VALID_PASSWORD_REGEX = 
			Pattern.compile("^.*(?=.{8,})(?=.*\\\\d)(?=.*[a-z])(?=.*[A-Z])(^[a-zA-Z0-9@\\\\$=!:.#%]+$)", Pattern.CASE_INSENSITIVE);
	
	
	private static final long serialVersionUID = 1L;
	
	Usuario u=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
	
	private String host;
	private String puerto;
	private String remitente;
	private String password;
	private boolean validForm;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidacionPasswordDosController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
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
	                
	                	case "abrirPassword":
	                		abrirPassword(request,response);
	                		break;
	                	case "valPassword":                		
	                		System.out.println("Ingresa por cambio de contraseña");
	                		
	                		String passantvp=ud.MD5(request.getParameter("passantvp"));
	            			System.out.println("Contraseña antigua " + passantvp);
	            			
	            			String passbdvp=request.getParameter("passbdvp");
	            			System.out.println("Contraseña base de datos " + passbdvp);
	            			
	            			            			
	            			String passnewvp =request.getParameter("passnewvp");            			
	            			System.out.println(validarPassword(passnewvp.trim()));
	            			
	            			String passnewrepvp =request.getParameter("passnewrepvp");            			
	            			System.out.println(validarPassword(passnewrepvp.trim()));
	            			
	            			String PassNew =ud.MD5(request.getParameter("passnewvp"));
	            			System.out.println("Contraseña nueva encriptada es: " + PassNew.trim());
	            			
	            			int dias = Integer.parseInt(request.getParameter("dias"));
	            			System.out.println("Número de días del enlace: " + dias);
	                		
	                		try {
	                		  response.setContentType("text/html;charset=UTF-8");
	                		  PrintWriter out=response.getWriter();
	                		  
	                		  if (!passantvp.trim().equals(passbdvp.trim())){
	                				System.out.println("!Su contraseña no coincide con la registrada,intente nuevamente¡");
	                	        	out.print("false;contrasenaval;!Su contraseña anterior no coincide con la registrada en nuestra base,intente nuevamente¡");
	                			}
	                		  
	                		  else if (PassNew.trim().equals(passbdvp.trim())){
	                				System.out.println("!Su contraseña es igual a la registrada en nuestra base de datos,por favor cambiela¡");
	                	        	out.print("false;contrasenaval;!Su contraseña es igual a la registrada en nuestra base de datos,por favor cambiela¡");
	                			}
	                		  else if(validarPassword(passnewvp.trim()) == false){               				
	                				
	                				System.out.println("Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo mínimo de 8 caracteres");
	                	        	out.print("false;passnewvp;!Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo mínimo de 8 caracteres¡");
	                			}
	                			else if(validarPassword(passnewrepvp.trim()) == false){               				
	                				
	                				System.out.println("Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo mínimo de 8 caracteres");
	                	        	out.print("false;passnewrepvp;!Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo mínimo de 8 caracteres¡");
	                			}
	                			else if(!passnewvp.trim().equals(passnewrepvp.trim())){               				
	                				
	                				System.out.println("Contraseña no coincide");
	                	        	out.print("false;passnewrepvp;!Contraseña no coincide¡");
	                			}
	                			else if(dias > 1){               				
	                				
	                				System.out.println("Su enlace venció, por favor dirigirse al módulo de olvidó su contraseña");
	                	        	out.print("false;diasvp;!Su enlace venció, por favor dirigirse al módulo de olvidó su contraseña¡");
	                			}
	                			else{
	                				
	                				out.print("true;!Se ha verificado su contraseña correctamente¡");
	                				              				
	                				
	                 			}             			
	                			
	                			
	                		}catch (Exception ex) {
	                            System.out.println("Error" + ex.getMessage());
	                        }               		   
	                		
	                		break;
	                	case "changePasswordVP":
	                		changePasswordVP(request,response);
	               		
	                		break;
	                	default:
	                        response.sendRedirect("ValidacionPasswordDosController?accion=abrirPassword");
	                  }
	                } else {
		                response.sendRedirect("ValidacionPasswordDosController?accion=abrirPassword");
		            }
		        } catch (Exception e) {
		            try {
		                request.getRequestDispatcher("ValidacionPasswordDosController?accion=abrirPassword").forward(request, response);
		
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
	
private void abrirPassword(HttpServletRequest request, HttpServletResponse response) {
        
        try{
            request.getRequestDispatcher("views/validationPassword.jsp").forward(request, response);
            System.out.println("Abrir el cambio de password");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el cambio de password" + e.getMessage());
            System.out.println("No se pudo abrir el cambio de password" + e.getMessage());
        }
	}
	
private void changePasswordVP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Entra por changePassword");

			if(request.getParameter("passnewvp")!=null) {
				
							
				u.setIdUsuario(Integer.parseInt(request.getParameter("id")));
				
				u.setContrasenaUsuario(ud.MD5(request.getParameter("passnewvp")));
				
							
				System.out.println("captura datos");
		    	
		   

			try {
				ud.changePassword(u);
				
				String nombreUsuario= request.getParameter("nombre");
		    	String apellidoUsuario = request.getParameter("apellido");
							
			    String destinatario=request.getParameter("correo");
			    
			    String enlace="http://localhost:8080/iluminarteProRollBack/UsuarioController?accion=abrirLogin";
			    
			    String imgclick="<img width='150' height='100' src ='https://pagina-jesus-mass.s3.us-east-2.amazonaws.com/click.jpg'/>";
			    
			    String asunto="BIENVENIDO A ILUMINARTE";
			    String cuerpo="<h1>Hola " + nombreUsuario + " " + apellidoUsuario + ",gracias por usar nuestros servicios en Iluminarte </h1>"
			    		+ "<h2> !Permitenos informarte que haz cambiado tu clave¡ </h2>"
			    		+ "<br> <br>"
			    		+ " <h3> Inicie sesión, haz  </h3>"    			
			    		+ " <a href= ' " + enlace + ">" + imgclick + "</a>"
			    		+ "<br> <br>"
			    		+ " <img width='150' height='100' src ='https://pagina-jesus-mass.s3.us-east-2.amazonaws.com/iluminarte2.jpeg'/>";
			    try {
			    	//Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
			    	Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
			    	System.out.println("Se envió el mensaje al nuevo usuario");
			    }catch(Exception e) {
			    	System.out.println("Se produjo un error al enviar el mensaje al nuevo usuario "+e.getMessage());
			    }
			    
			    response.sendRedirect("UsuarioController?accion=abrirLogin");
				
				
			}catch(Exception e) {
				System.out.println("Contraseña no actualizada "+e.getMessage());
			}
	        	
		}else {
			System.out.println("Contraseña no actualizada hay algún tipo de dato inválido ");
			
		}

	 }


}
