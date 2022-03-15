package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.Security;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Configmail;
import model.Pedido;
import model.TipoDocumento;
import model.TipoDocumentoDAO;
import model.TipoRol;
import model.TipoRolDAO;
import model.Usuario;
import model.UsuarioDAO;
import model.encoder;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.util.JRLoader;




/**
 * Servlet implementation class Usuario
 */
@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
			Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
	
	
	public static final Pattern VALID_PASSWORD_REGEX = 
			Pattern.compile("^.*(?=.{8,})(?=.*\\\\d)(?=.*[a-z])(?=.*[A-Z])(^[a-zA-Z0-9@\\\\$=!:.#%]+$)", Pattern.CASE_INSENSITIVE);
	
	
	
	
	private static final long serialVersionUID = 1L;


	private static final String String = null;
	
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
    public UsuarioController() {
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
                   
                	case "abrirLogin":
                		abrirLogin(request,response);
                		break;
                	case "login":
                		
                		u.setCorreoUsuario(request.getParameter("correo"));
                		u.setContrasenaUsuario(ud.MD5(request.getParameter("password")));
                		
                		try {
                			
                			String valCorreo=request.getParameter("correo");
                    		Matcher emailValidador = VALID_EMAIL_ADDRESS_REGEX.matcher(request.getParameter("correo"));
                    		
                    		String valPass=request.getParameter("password");
                    		
                    		
                    		int cant=ud.validarCorreo(request.getParameter("correo"));
                    		
                    			
                            System.out.println("Entro por validar correo "+cant);
                            
                			u=ud.validarUsuario(u.getCorreoUsuario(), u.getContrasenaUsuario());
                			if(u.getCorreoUsuario()!=null && u.isEstadoUsuario()==true) {
                				System.out.println("El DAO encontró el usuario y está activo.");
                				session.setAttribute("usua", u);

                				int roles=u.getIdRolFK().getIdRol();
                				
                				if(roles == 3) {
                					response.sendRedirect("UsuarioController?accion=abrirchangepass");
                				}else {
                					response.sendRedirect("UsuarioController?accion=listar");
                				}                				
                				
                			}
                			else if(u.getCorreoUsuario()!=null && u.isEstadoUsuario()==false) {
                				System.out.println("El DAO encontró el usuario y está inactivo.");
                				request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=Usuario inactivo, por favor consulte al administrador.").forward(request, response);
                			}
                			else if(!emailValidador.find() || valCorreo==null || valCorreo.isEmpty()) {
                             	System.out.println("El formato de correo es invalido");
                             	request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=El formato de correo es inválido").forward(request, response);
                             	                      
                             }
                			else if(cant==0) {
                            	System.out.println("El correo no esta registrado");
                            	request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=El correo no esta registrado").forward(request, response);
            
                            }
                            
                            else if(validarPassword(valPass.trim()) == false){               				
                  				
                  				System.out.println("Al menos debe tener una letra mayúscula, una minúscula,un digito y opcional un caracter especial y un largo minimo de 8 caracteres");
                  				request.getRequestDispatcher("UsuarioController?accion=abrirLogin&msn=El password no cumple con el formato").forward(request, response);
                  			}
                			else {
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
                	case "changePasswordVal":                		
                		System.out.println("Ingresa por cambio de contraseña");
                		
                		String passant=ud.MD5(request.getParameter("passant"));
            			System.out.println("Contraseña antigua " + passant);
            			
            			String passbd=request.getParameter("passbd");
            			System.out.println("Contraseña base de datos " + passbd);
            			
            			            			
            			String valPassNew =request.getParameter("passnew");            			
            			System.out.println(validarPassword(valPassNew.trim()));
            			
            			String valPassNewRep =request.getParameter("passnewrep");            			
            			System.out.println(validarPassword(valPassNew.trim()));
            			
            			String PassNew =ud.MD5(request.getParameter("passnew"));
            			System.out.println(PassNew.trim());
                		
                		try {
                		  response.setContentType("text/html;charset=UTF-8");
                		  PrintWriter out=response.getWriter();
                		  
                		  
                		  
                			if (!passant.trim().equals(passbd.trim())){
                				System.out.println("!Su contraseña no coincide con la registrada,intente nuevamente¡");
                	        	out.print("false;formatocontrasena;!Su contraseña no coincide con la registrada,intente nuevamente¡");
                			}
	                		  else if (PassNew.trim().equals(passbd.trim())){
	                				System.out.println("!Su contraseña es igual a la registrada en nuestra base de datos,por favor cambiela¡");
	                	        	out.print("false;formatopassnew;!Su contraseña es igual a la registrada en nuestra base de datos,por favor cambiela¡");
	                			}
                			else if(validarPassword(valPassNew.trim()) == false){               				
                				
                				System.out.println("Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo minimo de 8 caracteres");
                	        	out.print("false;formatopassnew;!Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo minimo de 8 caracteres¡");
                			}
                			else if(validarPassword(valPassNewRep.trim()) == false){               				
                				
                				System.out.println("Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo minimo de 8 caracteres");
                	        	out.print("false;formatopassnewrep;!Al menos debe tener una letra mayúscula, una minúscula,un digito,opcional un caracter especial y un largo minimo de 8 caracteres¡");
                			}
                			else if(!valPassNew.trim().equals(valPassNewRep.trim())){               				
                				
                				System.out.println("Contraseña no coincide");
                	        	out.print("false;formatopassnewrep;!Contraseña no coincide¡");
                			}
                			else{
                				
                				out.print("true;!Se ha verificado su contraseña correctamente¡");
                				              				
                				
                 			}             			
                			
                			
                		}catch (Exception ex) {
                            System.out.println("Error" + ex.getMessage());
                        }               		   
                		
                		
                		break;
                	case "changePassword":
                		changePassword(request, response);
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
                    case "validarFormulario":
                    	validarFormulario(request,response);
                    break;
                    case "changeEstado":
                    	changeEstado(request,response);
                    break;
                    
                    case "reporteUsuarios":
    					reporterUsuarios(request,response);
    				break;
    				
                    case "Cancelar":                    	
                    request.getRequestDispatcher("UsuarioController?accion=abrirForm").forward(request, response);
                   	 
                	 break;
          	                    
                    default:
                        response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            try {
                request.getRequestDispatcher("UsuarioController?accion=abrirForm").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }
	}
	
	
	private void reporterUsuarios(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		//Crear objeto de tipo ServletOutputStream
		ServletOutputStream out = response.getOutputStream();
        try {
        	//Declarar variables de imagenes y de reporte con sus rutas en webapp
            java.io.InputStream logo = this.getServletConfig()
                    .getServletContext()
                    .getResourceAsStream("reportes/img/iluminarte.png");
			java.io.InputStream reporteUsuario = this.getServletConfig()
                            .getServletContext()
                            .getResourceAsStream("reportes/reporteUsu.jasper");
			//Validar que no vengan vacios
            if (logo != null && reporteUsuario != null) {
                //Crear lista de la clase Vo para guardar resultado de la consulta
                List<Usuario> reporteUsuario1 = new ArrayList<>();
                reporteUsuario1=ud.Listar();
                
                //Declarar variable tipo Jasper Reports asignando el reporte creado
                JasperReport report = (JasperReport) JRLoader.loadObject(reporteUsuario);
                //Declarar variable ds para asignar el reporteUsuario1
                JRBeanArrayDataSource ds = new JRBeanArrayDataSource(reporteUsuario1.toArray());
                
                //Mapeamos los parámetros del Jasper reports
                Map<String, Object> parameters = new HashMap();
                parameters.put("ds", ds);
                parameters.put("logo", logo);
                //Formateamos la salida del reporte
                response.setContentType("application/pdf");
                //Para abrir el reporte en otra pestaña
                response.addHeader("Content-disposition", "inline; filename=ReporteUsuarios.pdf");
                //Imprimimos el reporte
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, ds);
                JasperExportManager.exportReportToPdfStream(jasperPrint, out);
                out.flush();
                out.close();
            } else {
                response.setContentType("text/plain");
                out.println("no se pudo generar el reporte");
                out.println("esto puede deberse a que la lista de datos no fue recibida o el "
                		+ "archivo plantilla del reporte no se ha encontrado");
                out.println("contacte a soporte");
            }
        } catch (Exception e) {
            response.setContentType("text/plain");
            out.print("ocurrió un error al intentar generar el reporte:" + e.getMessage());
            e.printStackTrace();
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
            request.setAttribute("msje", "No se pudo abrir el Cambio de Password " + e.getMessage());
            System.out.println("No se pudo abrir el Cambio de Password " + e.getMessage());
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
        	request.setAttribute("validForm", validForm);
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

private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
	Usuario registroUsuario=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
	 
	
    if((request.getParameter("tipodocumento")!="0") || (request.getParameter("tiporol")!="0") || (request.getParameter("nombre")!=null || request.getParameter("nombre")!="") || 
       (request.getParameter("apellido")!=null || request.getParameter("apellido")!="") || (request.getParameter("numero")!=null || request.getParameter("numero")!="" ) || (request.getParameter("direccion")!=null || request.getParameter("direccion")!="") || (request.getParameter("telefono")!=null || request.getParameter("telefono")!="") ||  
        (request.getParameter("correo")!=null || request.getParameter("correo")!="")) {
       	
    	String valorClave=ud.claves_aleatorias();
    	
    	
    	TipoDocumento r = new TipoDocumento();
        r.setIdTipoDocumento(Integer.parseInt(request.getParameter("tipodocumento")));
        
        registroUsuario.setIdTipodeDocumentoFK(r);
        
    	TipoRol tr = new TipoRol();
    	tr.setIdRol(Integer.parseInt(request.getParameter("tiporol")));
    	registroUsuario.setIdRolFK(tr);        
        
    	registroUsuario.setNombreUsuario(request.getParameter("nombre"));    	
    	registroUsuario.setApellidoUsuario(request.getParameter("apellido"));
    	//registroUsuario.setContrasenaUsuario(ud.MD5(request.getParameter("contrasena")));
    	registroUsuario.setContrasenaUsuario(ud.MD5(valorClave));    	
    	registroUsuario.setNumerodeIdentificacionUsuario(request.getParameter("numero"));
    	registroUsuario.setDireccionUsuario(request.getParameter("direccion"));
    	registroUsuario.setTelefonoUsuario(request.getParameter("telefono"));
    	registroUsuario.setCorreoUsuario(request.getParameter("correo"));
    	
  
	    if(request.getParameter("chkEstado")!=null) {
	    	registroUsuario.setEstadoUsuario(true);
	    }
	    else {
	    	registroUsuario.setEstadoUsuario(false);
	    }
	    
	    	String nombreUsuario= request.getParameter("nombre");
	    	String apellidoUsuario = request.getParameter("apellido");
	    	String destinatario=request.getParameter("correo");
	    	
			/*Date now = new Date();
			String currentTime = "" + now.getTime();*/
			
			LocalDateTime dateTime = LocalDateTime.now(); 
			
		    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
		    
		    String currentTime = dateTime.format(myFormatObj);  
			
			System.out.println("Fecha: " + currentTime);
			
			String urlString = "http://localhost:8080/iluminarteProRollBack/ValidacionPasswordController?method=KeyChange&enl=";
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
		    		+ " <img width='150' height='100' src ='https://pagina-jesus-mass.s3.us-east-2.amazonaws.com/iluminarte2.jpeg'/>"
		    		+ "<br> <br>"
		    		+ " <h3> Para iniciar sesión debe cambiar la clave asignada en el siguente enlace: </h3>"
		    		+ " <a href= " + link + ">" + link + "</a>";
		    		
		    try {
		    	//Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
		    	Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
		    	System.out.println("Se envió el mensaje al nuevo usuario");
		    }catch(Exception e) {
		    	System.out.println("Se produjo un error al enviar el mensaje al nuevo usuario "+e.getMessage());
		    }
    
    try{
    	ud.registrar(registroUsuario);
    	
    	
    	int persona = Integer.parseInt(request.getParameter("tiporol"));
    	
    	ud.registrarPersona(persona);
    	
    	System.out.println("tipo de persona: " + persona);
        
        response.sendRedirect("UsuarioController?accion=listar");
    	
    	System.out.println("Usuario Registrado");
    }catch(Exception e){
        request.setAttribute("msje", "No se pudo registrar el usuario controller" + e.getMessage());
        System.out.println("No se pudo registrar el usuario controller" + e.getMessage());
    }
    
   }else{
	    response.sendRedirect("UsuarioController?accion=abrirForm");
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

private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	System.out.println("Entra por changePassword");

		if(request.getParameter("passnew")!=null) {
			
						
			u.setIdUsuario(Integer.parseInt(request.getParameter("id")));
			
			u.setContrasenaUsuario(ud.MD5(request.getParameter("passnew")));
			
						
			System.out.println("captura datos");
	    	
	   

		try {
			ud.changePassword(u);
			
			String nombreUsuario= request.getParameter("nombre");
	    	String apellidoUsuario = request.getParameter("apellido");
						
		    String destinatario=request.getParameter("correo");
		    
		    String enlace="http://localhost:8080/iluminarteProRollBack/UsuarioController?accion=abrirLogin";
		    
		    String asunto="BIENVENIDO A ILUMINARTE";
		    String cuerpo="<h1>Hola " + nombreUsuario + " " + apellidoUsuario + " Gracias por usar nuestros servicios en Iluminarte </h1>"
		    		+ "<h2> !Permitenos informarte que haz cambiado tu clave¡ </h2>"
		    		+ "<br> <br>"		    		
		    		+ " <img width='150' height='100' src ='https://pagina-jesus-mass.s3.us-east-2.amazonaws.com/iluminarte2.jpeg'/>"
		    		+ "<br> <br>"
		    		+ " <h3> Inicie sesión en el siguente enlace </h3>"    			
		    		+ " <a href='http://localhost:8080/iluminarteProRollBack/UsuarioController?accion=abrirLogin'>" + enlace + "</a>";
		    try {
		    	//Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
		    	Configmail.enviarCorreo(host, puerto, remitente, password, destinatario, asunto, cuerpo);
		    	System.out.println("Se envió el mensaje al nuevo usuario");
		    }catch(Exception e) {
		    	System.out.println("Se produjo un error al enviar el mensaje al nuevo usuario "+e.getMessage());
		    }
		    
		    response.sendRedirect("UsuarioController?accion=logout");
			
			
		}catch(Exception e) {
			System.out.println("Contraseña no actualizada "+e.getMessage());
		}
        	
	}else {
		System.out.println("Contraseña no actualizada hay algún tipo de dato inválido ");
		
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


private void validarFormulario(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
  
	  System.out.println("validarFormulario de registrar usuario");
	
	  response.setContentType("text/html;charset=UTF-8");
	  PrintWriter out=response.getWriter();
	  
	  String tipodocumento = request.getParameter("tipodocumento");
	    
	  
	  System.out.println("tipodocumento "+tipodocumento);
	  
	  
	  
	  String tiporol = request.getParameter("tiporol");
	  
	  System.out.println("tiporol "+tiporol);
	
	  String nombre = request.getParameter("nombre");
		
	  String email=request.getParameter("correo");
	
	  String apellido=request.getParameter("apellido");
	  
	  String numero=request.getParameter("numero");
	  
	  String direccion=request.getParameter("direccion");
	  
	  String contacto=request.getParameter("telefono");
	  		
		Matcher emailValidador = VALID_EMAIL_ADDRESS_REGEX.matcher(request.getParameter("correo"));
		
	
		int cant=ud.validarCorreo(request.getParameter("correo"));
		
		int cantNumDocum=ud.validarNumeroDocumento(request.getParameter("numero"));
		
		
	    	
        System.out.println("Entro por validar correo "+cant);
        
        if(!emailValidador.find() || email==null || email.isEmpty()) {
        	System.out.println("!El formato de correo es invalido!");
        	out.print("false;formatocorreo;!El formato de correo es invalido!");
        	return;
        }
        
        else if(cant!=0) {
        	System.out.println("!El correo ya está registrado!");
        	out.print("false;formatocorreo;!El correo ya está registrado!");
        	return;
        }
        
        else if(tipodocumento.equals("0")) {
           	System.out.println("!No ha seleccionado alguna opcion!");
           	out.print("false;formatotipodocumento;!No ha seleccionado alguna opcion!");
           	return;
           } 
 
        else if(tiporol.equals("0")) {
           	System.out.println("!No ha seleccionado alguna opcion!");
           	out.print("false;formatotiporol;!No ha seleccionado alguna opcion!");
           	return;
           }
        
        else if(nombre.trim().length() <= 1 || nombre.trim().length() > 50) {
           	System.out.println("El formato del nombre es incorrecto");
           	out.print("false;formatonombre;!Caracteres permitidos en el campo es 2 a 50!");
           	return;
           }        
        
        else if(nombre == null || nombre.isEmpty() || validarTexto(nombre.trim()) == false) {
           	System.out.println("¡Solo se admiten letras, por favor verificar!");
           	out.print("false;formatonombre;¡Solo se admiten letras, por favor verificar!");
           	return;
           }
        
        else if(apellido.trim().length() <= 1 || apellido.trim().length() > 50) {
           	System.out.println("!Caracteres permitidos en el campo es 2 a 50!");
           	out.print("false;formatoapellido;!Caracteres permitidos en el campo es 2 a 50!");
           	return;
           }
        
        else if(apellido == null || apellido.isEmpty() || validarTexto(apellido.trim()) == false) {
           	System.out.println("¡Solo se admiten letras, por favor verificar!");
           	out.print("false;formatoapellido;¡Solo se admiten letras, por favor verificar!");
	          	
           	return;
           }
        
        else if(cantNumDocum!=0) {
        	System.out.println("El número de documento ya está registrado");
        	out.print("false;formatonumdocum;¡El número de documento ya está registrado!");
        	return;
        }        
 
        else if(numero.trim().length() < 1 || numero.trim().length() > 30) {
           	System.out.println("!Numeros permitidos en el campo es 1 a 30!");
           	out.print("false;formatonumdocum;!Numeros permitidos en el campo es 1 a 30!");
           	return;
           }
        
        else if(numero == null || numero.isEmpty() || validarNumeros(numero.trim()) == false) {
           	System.out.println("¡Solo se admiten valores Númericos!");
           	out.print("false;formatonumdocum;¡Solo se admiten valores Númericos!");
           	return;
           }
        
        else if(direccion.trim().length() < 1 || direccion.trim().length() > 50) {
           	System.out.println("!Caracteres permitidos en el campo es 2 a 50!");
           	out.print("false;formatodireccion;!Caracteres permitidos en el campo es 2 a 50!");
           	return;
           }
        
        else if(contacto.trim().length() < 2 || contacto.trim().length() > 40) {
           	System.out.println("!Caracteres permitidos en el campo es 2 a 40!");
           	out.print("false;formatocontacto;!Caracteres permitidos en el campo es 2 a 40!");
           	return;
           }
       
        else {
        	out.print("true;!El formato de los campos es correcto¡");
        	return;
        }

}

//metodo para validar parametros de tipo int

public static boolean validarNumeros(String datos) {
	return datos.matches("[0-9]*");
}

public static boolean validarTexto(String datos) {
	
	    int length = 0;
		int validaTextFalse = 0;             //variable captura el mensaje de error
		String error = null;
		
		System.out.println("caracteres ascii "+datos);
		
		for (int x =0; x < datos.length(); x++) {
			


	        byte[] bytes = datos.getBytes(StandardCharsets.US_ASCII);
	        System.out.println("ASCII Numeric Value: "+bytes[x] + " pertenece a letra " + datos.charAt(x));
	        
	    if ((bytes[x] == 32) || (bytes[x] == 63) || (bytes[x] >= 65 && bytes[x] <= 90) || (bytes[x]>= 97 && bytes[x] <= 122) || (bytes[x] >= 160 && bytes[x] <= 165)) {

	    	
	    	System.out.println("Caracter está dentro de los valores permitidos ");
	    	
	   	}else {
	   			
	   		validaTextFalse++;
	   		System.out.println("Caracter está fuera de los valores permitidos ");
	   		error="Caracter no permitido";
	   	}
        
        		
     length = (x + 1); // Cuenta la longitud del nombre

    }
		
	if (length <= 1 || length > 50) {                // Revisa la longitud minima o maxima del campo
		validaTextFalse=validaTextFalse+1;
			System.out.println("no cumple con el mínimo o maximo de caracteres permitidos en el campo!");
			error =error + " y el largo de caracteres permitidos en el campo";
		}
	
	if (validaTextFalse >= 1){
		
		System.out.println("Texto ingresado tiene " + validaTextFalse + " errores en " + error);
		
		return false;
	}else {
		
		System.out.println("Texto ingresado tiene " + validaTextFalse + " errores en " + error);
	
		return true;
	}
	
	
}


	public boolean getValidForm() {
		return validForm;
	}
	
	public void setValidForm(boolean validForm) {
		this.validForm = validForm;
	}


	/*private void keyChange(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("Se entro al metodo ");
		
		String enlace =request.getParameter("enl");
		
		System.out.println("El enlace es " + enlace);
		
		
		
		
		
		
	 }*/


	/*private void changeEstado(HttpServletRequest request, HttpServletResponse response) {
		
		Boolean es = Boolean.parseBoolean(request.getParameter("es"));
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		System.out.println("Se entro al metodo changeEstado" + es + id);
		
		
		try {
			
			
			ud.cambiarEstado(es,id);
			response.sendRedirect("UsuarioController?accion=listar");
		}catch(Exception e) {
			System.out.println("Estado NO actualizado "+e.getMessage());
		}
	 }*/



}
