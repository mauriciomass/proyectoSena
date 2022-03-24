

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import model.UsuarioDAO;
import model.Vendedor;
import model.VendedorDAO;
import model.Producto;
import model.ProductoDAO;
import model.Proveedor;
import model.TipoDocumento;
import model.TipoDocumentoDAO;
import model.TipoRol;
import model.Cliente;
import model.ClienteDAO;
import model.DetallePedido;
import model.GenerarSerie;
import model.Pedido;
import model.PedidoDAO;
import model.DetallePedido;
import model.DetallePedidoDAO;

/**
 * Servlet implementation class Ventas
 */
@WebServlet("/VentasController")
public class VentasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Usuario u=new Usuario();
	UsuarioDAO ud=new UsuarioDAO();
	
	Producto p=new Producto();
	ProductoDAO pro=new ProductoDAO();
	
	Pedido pe=new Pedido();
	PedidoDAO pedao=new PedidoDAO();
	
	DetallePedido dpe=new DetallePedido();
	DetallePedidoDAO dpedao=new DetallePedidoDAO();
	
	Cliente cl=new Cliente();
	ClienteDAO cldao =new ClienteDAO();
	
	Vendedor ven=new Vendedor();
	VendedorDAO vendao= new VendedorDAO();
		
	Double totalPagar=0.0;
	
	List<Pedido> lped=new ArrayList<>();
	
	String numeroserie;
	
	String descripcion;
	
	String vendpl;
	
	
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
		
		
		
		String [] accionPartes = request.getParameter("accion").split("_");
		
		System.out.println("la accion entró a ventas controller " + accionPartes[0]);
		
		String accion = accionPartes[0];
		
		String menu = request.getParameter("menu");
		
		
		
		try {
			this.obtenerNumeroSerie(request);
			
			 if (accion != null) {
                switch (accion) {
                
                case "abrirForm":
                	abrirForm(request,response);
                	break;
                
                case "BuscarCliente":
                	this.lped=new ArrayList<Pedido>();
                	BuscarCliente(request, response);
                	System.out.println("BuscarCliente");
            		break;
            		
                case "BuscarProducto":                	
                	BuscarProducto(request, response);
                	System.out.println("BuscarProducto");
            		break; 
            		
                case "Agregar":                	
                	Agregar(request, response);
                	System.out.println("Agregar");
            		break;
            		
                case "GenerarVenta":
                	GenerarVenta(request, response);
                	System.out.println("GenerarVenta");
            		break;
            		
                case "eliminaId":
                	System.out.println("entro a elimina id numero de partes " + accionPartes.length); 
                	 if(accionPartes.length > 1) {
                		 System.out.println("Producto Id " + accionPartes[1]); 
                		 eliminaId(request, response,accionPartes[1]);
                     	 System.out.println("eliminaId"); 
                	 }
                	 
             		 break;
             		 
                case "editaId":
                	System.out.println("entro a edita id numero de partes " + accionPartes.length); 
                	 if(accionPartes.length > 1) {
                		 System.out.println("Producto Id " + accionPartes[1]); 
                		 editaId(request, response,accionPartes[1]);
                     	 System.out.println("editaId"); 
                	 }
                	 
             		 break;
             		 
                case "Cancelar":
                	
                	 this.lped=new ArrayList<Pedido>();
                	 
             		 break;
             		 
                case "validarFormVentas":
                	validarFormVentas(request, response);
                	break;
                default:
                	
                	this.obtenerNumeroSerie(request);
                	
                	System.out.println("No busco cliente");
                    request.getRequestDispatcher("views/venta.jsp").forward(request, response); 
                    
                                
                } 
                
            }else {
                    response.sendRedirect("login.jsp");
            	
                }    
            
			request.getRequestDispatcher("views/venta.jsp").forward(request, response);
			
			 
            
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
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
            request.getRequestDispatcher("views/venta.jsp").forward(request, response);
            System.out.println("formulario abierto de ventas");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el formulario de ventas" + e.getMessage());
            System.out.println("No se pudo abrir el formulario de ventas" + e.getMessage());
        }finally{
            
        }
	}
	
	private void BuscarCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
			
		try{	
		
			this.obtenerNumeroSerie(request);
			
						
			totalPagar=0.0;			
			request.setAttribute("totalpagar",totalPagar);
			
			
			String numi=request.getParameter("codigocliente");
			u.numeroIdentificacion(numi);
			
			
			u = ud.buscar(numi);
			
			request.setAttribute("c",u);		               	
			             	
			System.out.println("Usuario buscado");
			
					
			
		}catch(Exception e){
            request.setAttribute("msje", "No existe el cliente a buscar" + e.getMessage());
            System.out.println("No existe el cliente a buscar" + e.getMessage());
        }
			
	}
	
	private void BuscarProducto(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		try {
		
				this.obtenerNumeroSerie(request);
				
								
				String cod=request.getParameter("codigoproducto");
				p.productoCod(cod);		
				
				p = pro.consultaporCod(cod);
				
				request.setAttribute("c",u);
				
				request.setAttribute("producto",p);
				
						
				request.setAttribute("totalpagar",totalPagar);
				
				//request.setAttribute("lista",lped);
				
				this.listaTabla(request);
				
				System.out.println("Producto buscado");
		
		}catch(Exception e){
            request.setAttribute("msje", "No existe el producto a buscar" + e.getMessage());
            System.out.println("No existe el producto a buscar" + e.getMessage());
        }
		
	}

	private void Agregar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
			
		
		try {
		
			if(request.getParameter("nomproducto")!=null ||  request.getParameter("nombrescliente")!=null) {
			
			this.obtenerNumeroSerie(request);
			
			request.setAttribute("c",u);
			
			totalPagar=0.0;	
			
				
			int item = 0 ;
			
			item = item + 1 ;
			
			int idpro = p.getIdProducto();
			
			System.out.println("Agregar id del producto " + idpro);
			
			String cod = p.getCodProducto();
			
			String descripcion = request.getParameter("nomproducto");
			
			
			Double precio = Double.parseDouble(request.getParameter("precio"));
			
			int cant=Integer.parseInt(request.getParameter("cant"));
			
			Double subtotal = precio * cant;
			
			pe = new Pedido();
			
			pe.setItem(item);
			pe.setCodProducto(cod);
			pe.setDescripcionPedido(descripcion);
			pe.setPrecio(precio);
			pe.setCantidad(cant);
			pe.setSubtotal(subtotal);
			
			pe.setIdProducto(idpro);
		
			System.out.println("Agregar id despues del set de producto " + pe);
			
			lped.add(pe);
			
			this.calcularTotalPagar(request);
			
			request.setAttribute("totalpagar",totalPagar);			
			
			
			//request.setAttribute("lista",lped);
			
			this.listaTabla(request);
					
			             	
			System.out.println("Pedido buscado");
			}else {
				System.out.println("No agrego la información");
			}
		
		}catch(Exception e){
            request.setAttribute("msje", "No agrego la información" + e.getMessage());
            System.out.println("No agrego la información" + e.getMessage());
        	}
		
		}
	
	
	
	
	private void GenerarVenta(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		
		
		try {
		
			if(request.getParameter("nomproducto")!=null ||  request.getParameter("nombrescliente")!=null) {
			
			System.out.println("Entró a GenerarVenta");
			

			Date date = new Date();
			
			java.sql.Date sqldate = new java.sql.Date(date.getTime());
			
			//Actualización del stock
			
			for (int i = 0; i < lped.size();i++) {
				Producto p=new Producto();
				int cantidad = lped.get(i).getCantidad();
				int idProducto = lped.get(i).getIdProducto();
				
				ProductoDAO pro=new ProductoDAO();
				
				p=pro.consultaporId(idProducto);
				
				int sac = p.getStockProducto() - cantidad;
				
				pro.actualizarstock(idProducto, sac);
			}
			
			//Guardar Venta
			
				//Cliente para guardar la venta
			
			Cliente cl=new Cliente();
			
			String idCustomer = u.getNumerodeIdentificacionUsuario();
			
			System.out.println("Cliente de la vista " + idCustomer);
			
			ClienteDAO cldao=new ClienteDAO();
			
			int cli=cldao.traeIdCliente(idCustomer);
			
			
			System.out.println("Cliente dao " + cli);
			
			//Vendedor para guardar la venta
			
			Vendedor ven=new Vendedor();
		
	
		
			String vendpl2=  this.obtenerIdVendedor(request);
				
			
			System.out.println("Vendedor de la vista " + vendpl2);
			
			VendedorDAO vendao=new VendedorDAO();
			
			int vend=vendao.traeIdVendedor(vendpl2);
			
			String descripcion = this.obtenerIdVendedor(request);
			
			
			System.out.println("Vendedor dao " + vend);
		
		
		
			pe.setIdClienteFK(cli);
			
			pe.setIdVendedorFK(vend);
			
			//pe.setIdClienteFK(1);
			//pe.setIdVendedorFK(1);
			//pe.setDescripcionPedido(p.getNombreProducto());
			
			pe.setDescripcionPedido(descripcion);
			pe.setNumeroSeriePedido(numeroserie);
			pe.setFechaPedido(sqldate);
			pe.setMontoPedido(totalPagar);
			pe.setEstadoPedido(true);
			pe.setRealizaCompraPedido(true);
			
			
			
			
			pedao.guardarVenta(pe);
			
			//Guardar detalle ventas
			
			int idv=Integer.parseInt(pedao.IdVentas());
			for (int i = 0; i < lped.size() ;i++) {
				DetallePedido dpe = new DetallePedido();
				
				dpe.setIdPedidoFK(idv);
				dpe.setIdProductoFK(lped.get(i).getIdProducto());
				dpe.setCantidadDetallePedido(lped.get(i).getCantidad());
				dpe.setPrecioDetallePedido(lped.get(i).getPrecio());
				
				dpedao.guardarDetalleventas(dpe);
			}
		
	              	
			             	
			System.out.println("Genero Venta");
			
			request.getRequestDispatcher("views/venta.jsp").forward(request, response);
			
			}else{
				System.out.println("No hay información para generar la venta");
			}

		
		}catch(Exception e){
            request.setAttribute("msje", "No hay información para agregar" + e.getMessage());
            System.out.println("No hay información para agregar" + e.getMessage());
        	}
		}
		

	private void obtenerNumeroSerie(HttpServletRequest request) throws SQLException {
		numeroserie=pedao.GenerarSerie();
    	
    	if(numeroserie==null) {
    		numeroserie="00000001";
    		request.setAttribute("nserie", numeroserie);
    		System.out.println("Entro al if numero de serie");
    	}
    	
    	else {
    		int incrementar=Integer.parseInt(numeroserie);
    		GenerarSerie gs = new GenerarSerie();
    		numeroserie=gs.NumeroSerie(incrementar);
    		request.setAttribute("nserie", numeroserie);
    		System.out.println("Entro al else numero de serie");
    	}
	}
	
	private String obtenerIdVendedor(HttpServletRequest request) throws SQLException {
		
		
		HttpSession session =request.getSession();
		
		Usuario usu = (Usuario)session.getAttribute("usua");
		
		System.out.println("Pruebaaaa Vendedor numero " + usu.getNumerodeIdentificacionUsuario());
		return usu.getNumerodeIdentificacionUsuario();

	}
	
	private void calcularTotalPagar(HttpServletRequest request) throws SQLException {	
		
			
			for (int i =0;i < lped.size();i++) {
				totalPagar=totalPagar + lped.get(i).getSubtotal();
			}
		
			
	}
	
	
	
	private List<Pedido> listaTabla (HttpServletRequest request) {
		
		request.setAttribute("lista",lped);
		return lped;	
		
	}
	
	private void eliminaId(HttpServletRequest request, HttpServletResponse response,String productId) throws SQLException, ServletException, IOException {
		
	 Pedido pedido=lped.stream()//Recorre la lista de Pedido
			 .filter(p->p.getIdProducto()==Integer.valueOf(productId))//Realiza una comparacion si está llegando el producto
			 .findFirst()//Toma el primer objeto que cumpla con la condición
			 .get();//Obtener el objeto
		
	 System.out.println("producto " + pedido);
		
		this.obtenerNumeroSerie(request);
		
		request.setAttribute("c",u);
		
		
		totalPagar=totalPagar - pedido.getSubtotal();
		
		System.out.println("valor final " + totalPagar);
		
		lped.removeAll(Arrays.asList(pedido));
		
	
		this.listaTabla(request);
		
		request.setAttribute("totalpagar",totalPagar);				
		
		
		
		
	
		             	
		System.out.println("Pedido eliminado");
		
		request.getRequestDispatcher("views/venta.jsp").forward(request, response);
		
	}
	
	private void editaId(HttpServletRequest request, HttpServletResponse response,String productId) throws SQLException, ServletException, IOException {
		
		Pedido pedido=lped.stream()//Recorre la lista de Pedido
				 .filter(p->p.getIdProducto()==Integer.valueOf(productId))//Realiza una comparacion si está llegando el producto
				 .findFirst()//Toma el primer objeto que cumpla con la condición
				 .get();//Obtener el objeto
			
		this.obtenerNumeroSerie(request);
		
		request.setAttribute("c",u);
		
		
		
		int valcant=Integer.parseInt(request.getParameter("valcant"));
		
		System.out.println("Valor de valcant: " + valcant);
		
		Double subtotal = pedido.getPrecio() * valcant;
		
		System.out.println("Valor de subtotal: " + subtotal);
		
		
		totalPagar=totalPagar + subtotal - pedido.getSubtotal();
		
		pedido.setCantidad(valcant);
		
		pedido.setSubtotal(subtotal);
		
		lped.removeAll(Arrays.asList(pedido));
		
		lped.add((pedido));
		
		
		this.listaTabla(request);
		
		request.setAttribute("totalpagar",totalPagar);
		
		
		
	}
	
	private void validarFormVentas(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		  
		  System.out.println("validarFormulario de Ventas");
		
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  
		  String cant = request.getParameter("cant");
		    
		  
		  System.out.println("cant "+cant);
		  
		  
		  if(cant != null || !(cant.isEmpty()) || ud.validarNumeros(cant.trim()) == true) {
	         	System.out.println("¡Valor admitido!");
	         	out.print("true;!El formato de los campos es correcto¡");
	         	return;
	         }
	      
	      else {
	    	  
	    	    System.out.println("¡Valor no admitido!");
	         	out.print("false;msncantvent;¡Valor admitido!");
	      	
	      	return;
	      }

	}
	
	
}
