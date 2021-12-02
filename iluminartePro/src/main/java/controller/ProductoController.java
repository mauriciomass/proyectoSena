package controller;

import java.io.IOException;
import java.io.InputStream;
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

private void add(HttpServletRequest request, HttpServletResponse response) {
	   
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
    	
    	Part part = null;
		try {
			part = request.getPart("imagen");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	InputStream inputStream = null;
		try {
			inputStream = part.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	p.setImagenProducto(inputStream);
    	
    	
    	p.setStockProducto(Integer.parseInt(request.getParameter("stock")));
    	

    	
    }
    if(request.getParameter("chkEstado")!=null) {
    	p.setEstadoProducto(true);
    }
    else {
    	p.setEstadoProducto(false);
    }
    try{
    	pro.registrar(p);
        //request.getRequestDispatcher("views/role.jsp").forward(request, response);
        response.sendRedirect("ProductoController?accion=listar");
    	System.out.println("Producto Registrado");
    }catch(Exception e){
        request.setAttribute("msje", "No se pudo registrar el producto controller" + e.getMessage());
        System.out.println("No se pudo registrar el producto controller" + e.getMessage());
    }finally{
    	//ud=null;
    }
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

private void edit(HttpServletRequest request, HttpServletResponse response) {
	
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
    	
    	
    	   	
    	
    	Part part = null;
		try {
			part = request.getPart("imagen");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	InputStream inputStream = null;
		try {
			inputStream = part.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	p.setImagenProducto(inputStream);
    	
 	 
    }
    if(request.getParameter("chkEstado")!=null) {
    	p.setEstadoProducto(true);
    }
    else {
    	p.setEstadoProducto(false);
    }
    
    p.setStockProducto(Integer.parseInt(request.getParameter("stock")));
    
	try {
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

