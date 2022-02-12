package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



import model.Producto;
import model.ProductoDAO;
import model.Categoria;
import model.CategoriaDAO;
import model.Proveedor;
import model.ProveedorDAO;
import model.TipoDocumento;
import model.TipoRol;
import model.TipoRolDAO;


@MultipartConfig
/**
 * Servlet implementation class Producto
 */
@WebServlet("/ProductoController")
public class ProductoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Producto p=new Producto();
	ProductoDAO pro=new ProductoDAO();
	
	private String pathFiles = "C:\\xampp\\htdocs\\"+File.separator+"img\\"+File.separator;
	
	private File uploads = new File(pathFiles);
	private String[] extens = {".ico", ".png", ".jpg", ".jpeg"};
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {
                   
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
	
	private void listar(HttpServletRequest request, HttpServletResponse response) {
  
        
        try{
        	List producto=pro.Listar();
            request.setAttribute("producto", producto);
            request.getRequestDispatcher("views/producto.jsp").forward(request, response);
            System.out.println("Productos encontrados");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo listar los productos" + e.getMessage());
            System.out.println("No se pueden listar los productos" + e.getMessage());
        }finally{
        	//pro=null;
        }
	}
	
private void abrirForm(HttpServletRequest request, HttpServletResponse response) {
        
        try{
        	this.obtenerCategorias(request);
        	this.obtenerProveedores(request);
            request.getRequestDispatcher("views/producto-add.jsp").forward(request, response);
            System.out.println("formulario abierto");
        }catch(Exception e){
            request.setAttribute("msje", "No se pudo abrir el formulario" + e.getMessage());
            System.out.println("No se pudo abrir el formulario" + e.getMessage());
        }finally{
            
        }
	}

private void obtenerCategorias(HttpServletRequest request) {
	CategoriaDAO rdao=new CategoriaDAO();
    List<Categoria> categoria = null;
    try {
        categoria = rdao.listarCategoria();
        request.setAttribute("categoria", categoria);
    } catch (Exception e) {
        request.setAttribute("msje", "No se pudo cargar los cargos :( " + e.getMessage());
    } finally {
       // rdao=null;
    }
}

private void obtenerProveedores(HttpServletRequest request) {
	ProveedorDAO rdao=new ProveedorDAO();
    List<Proveedor> proveedor = null;
    try {
        proveedor = rdao.listarProveedor();
        request.setAttribute("proveedor", proveedor);
    } catch (Exception e) {
        request.setAttribute("msje", "No se pudo cargar los cargos :( " + e.getMessage());
    } finally {
        //rdao=null;
    }
}

private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {

try {
    if(request.getParameter("categoria")!=null && request.getParameter("proveedor")!=null) {
       	Categoria r = new Categoria();
        r.setIdCategoria(Integer.parseInt(request.getParameter("categoria")));
        p.setIdCategoriaFK(r);
        
    	Proveedor prov = new Proveedor();
    	prov.setIdProveedor(Integer.parseInt(request.getParameter("proveedor")));
        p.setIdProveedorFK(prov);        
        
    	p.setNombreProducto(request.getParameter("nombre"));    	
    	p.setPrecioProducto(Double.parseDouble(request.getParameter("precio")));
    	p.setDescripcionProducto(request.getParameter("descripcion"));
    	
    	p.setStockProducto(Integer.parseInt(request.getParameter("stock")));
    	
    	p.setCodProducto(request.getParameter("codProducto"));
    	
    	Part part = request.getPart("imagen");
    	
		  if(part == null) {
					System.out.println("No ha seleccionado un archivo");
					return;
				}
				
				if(isExtension(part.getSubmittedFileName(), extens)) {
					String imagenProd = saveFile(part, uploads);
					
					//Producto ip= new Producto();
					
					p.ImagenPhoto(imagenProd);
				
										
					
				}
		
				if(request.getParameter("chkEstado")!=null) {
			    	p.setEstadoProducto(true);
			    }
			    else {
			    	p.setEstadoProducto(false);
			    }
			 		
				pro.registrar(p);
				
      }	
    }catch (Exception e) {
				e.printStackTrace();
	}
			
    response.sendRedirect("ProductoController?accion=listar");
}
  

private String saveFile(Part part, File pathUploads) {
	String pathAbsolute = "";
	String ruta="";
	
	try {
		
		Path path = Paths.get(part.getSubmittedFileName());
		String fileName = path.getFileName().toString();
		InputStream input = part.getInputStream();
		
		if(input != null) {
			
			File file = File.createTempFile("imagen",fileName, pathUploads);
			pathAbsolute = file.getAbsolutePath();
			ruta=file.getName();
			System.out.println(ruta);
			Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return ruta;
}

private boolean isExtension(String fileName, String[] extensions) {
	for(String et : extensions) {
		if(fileName.toLowerCase().endsWith(et)) {
			return true;
		}
	}
	
	return false;
}
	   
    

private void eliminar(HttpServletRequest request, HttpServletResponse response) {
	
    if(request.getParameter("id")!=null) {
    	p.setIdProducto(Integer.parseInt(request.getParameter("id")));
    }
    try{
    	pro.eliminar(p.getIdProducto());
        //request.getRequestDispatcher("views/role-edit.jsp").forward(request, response);
    	response.sendRedirect("ProductoController?accion=listar");
    	System.out.println("Producto Eliminado");
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
		this.obtenerCategorias(request);
		this.obtenerProveedores(request);
		p=pro.consultaporId(id);
		request.setAttribute("producto", p);
		request.getRequestDispatcher("views/producto-edit.jsp").forward(request, response);
		System.out.println("Producto encontrado "+id);
		
	}catch(Exception e) {
		System.out.println("Producto NO encontrado "+e.getMessage());
	}
	finally {
		//ud=null;
	}

 }

private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	try {
		if(request.getParameter("id")!=null &&  request.getParameter("categoria")!=null ) {
			
			p.setIdProducto(Integer.parseInt(request.getParameter("id")));
			
			Categoria r = new Categoria();
	        r.setIdCategoria(Integer.parseInt(request.getParameter("categoria")));
	        p.setIdCategoriaFK(r);
	        
	    	Proveedor prov = new Proveedor();
	    	prov.setIdProveedor(Integer.parseInt(request.getParameter("proveedor")));
	        p.setIdProveedorFK(prov);
	        
	    	p.setNombreProducto(request.getParameter("nombre"));    	
	    	p.setPrecioProducto(Double.parseDouble(request.getParameter("precio")));
	    	p.setDescripcionProducto(request.getParameter("descripcion"));
	    	
	  	
	    	Part part = request.getPart("imagen");
	    	
			  if(part == null) {
						System.out.println("No ha seleccionado un archivo");
						return;
					}
					
					if(isExtension(part.getSubmittedFileName(), extens)) {
						String imagenProd = saveFile(part, uploads);
						
						//Producto ip= new Producto();
						
						p.ImagenPhoto(imagenProd);
					
																
					}					
	    	
	 	 
	    }
	    if(request.getParameter("chkEstado")!=null) {
	    	p.setEstadoProducto(true);
	    }
	    else {
	    	p.setEstadoProducto(false);
	    }
	    
	    p.setStockProducto(Integer.parseInt(request.getParameter("stock")));
	   
	    p.setCodProducto(request.getParameter("codProducto"));
		
	    pro.actualizar(p);
		response.sendRedirect("ProductoController?accion=listar");
		
	}catch(Exception e) {
		System.out.println("Producto NO actualizado "+e.getMessage());
	}

	
}

private void changeEstado(HttpServletRequest request, HttpServletResponse response) {
	
	Boolean es = Boolean.parseBoolean(request.getParameter("es"));
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	System.out.println("Se entro al metodo changeEstado" + es + id);
	
	
	try {
		
		
		pro.cambiarEstado(es,id);
		response.sendRedirect("ProductoController?accion=listar");
	}catch(Exception e) {
		System.out.println("Estado NO actualizado "+e.getMessage());
	}
}


}

