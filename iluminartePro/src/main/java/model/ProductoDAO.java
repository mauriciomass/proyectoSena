package model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

public class ProductoDAO {
	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;
	

	public List Listar() throws SQLException {
		List<Producto> lpro=new ArrayList<>();
			    
		sql="SELECT producto.idProducto,categoria.nombreCategoria,proveedor.nombreProveedor, producto.nombreProducto,producto.precioProducto,producto.descripcionProducto, producto.imagenProducto,producto.estadoProducto,producto.stockProducto "
				+ "FROM producto " 
				+"JOIN categoria ON categoria.idCategoria=producto.idCategoriaFK " 
				+"JOIN proveedor ON proveedor.idProveedor = producto.idProveedorFK";
	    
		
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta

					
			while(rs.next()) {
				Producto p=new Producto();
				//Escribir en el setter de cada objeto
				p.setIdProducto(rs.getInt(1));
				
				p.setIdCategoriaFK(new Categoria());
				p.getIdCategoriaFK().setNombreCategoria(rs.getString(2));
				
				p.setIdProveedorFK(new Proveedor());
				p.getIdProveedorFK().setNombreProveedor(rs.getString(3));
				
				p.setNombreProducto(rs.getString(4));
				p.setPrecioProducto(rs.getDouble(5));
				p.setDescripcionProducto(rs.getString(6));
				p.setImagenProducto(rs.getString(7));
				
				p.setEstadoProducto(rs.getBoolean(8));
				
				p.setStockProducto(rs.getInt(9));
				
				lpro.add(p);
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa");
		}catch(Exception e) {
			System.out.println("No existen productos definidos "+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return lpro;
	}
	
	
	public int registrar(Producto pr) throws SQLException {
		sql="INSERT INTO producto (idCategoriaFK,idProveedorFK, nombreProducto, precioProducto,descripcionProducto,imagenProducto,estadoProducto,stockProducto) VALUES (?,?,?,?,?,?,?,?)";
		try {
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			
			ps.setInt(1,pr.getIdCategoriaFK().getIdCategoria());
			ps.setInt(2,pr.getIdProveedorFK().getIdProveedor());
			
			ps.setString(3, pr.getNombreProducto());
			ps.setDouble(4, pr.getPrecioProducto());
			ps.setString(5, pr.getDescripcionProducto());
			ps.setString(6, pr.getImagenProducto());
			ps.setBoolean(7, pr.isEstadoProducto());
			ps.setInt(8, pr.getStockProducto());
			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se registró un producto");
			
		}catch(Exception e) {
			System.out.println("Error en el registro del producto "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	public void eliminar(int id) throws SQLException {
		sql="DELETE FROM producto WHERE idProducto="+id;
		System.out.println(sql);
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
			System.out.println("Se eliminó el producto");
		}catch(Exception e) {
			System.out.println("Error en la eliminación del producto "+e.getMessage());
		}
		finally {
			con.close();
		}
	}
	
	public Producto consultaporId(int id) throws SQLException {
		Producto p=new Producto();
		sql="SELECT * FROM producto WHERE idProducto="+id;
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			System.out.println(ps);
			
			while(rs.next()) {
				p.setIdProducto(rs.getInt(1));
				
				p.setIdCategoriaFK(new Categoria());
				p.getIdCategoriaFK().setNombreCategoria(rs.getString(2));
				
				p.setIdProveedorFK(new Proveedor());
				p.getIdProveedorFK().setNombreProveedor(rs.getString(3));
				
				p.setNombreProducto(rs.getString(4));
				p.setPrecioProducto(rs.getDouble(5));
				p.setDescripcionProducto(rs.getString(6));
				p.setImagenProducto (rs.getString(7));
				p.setEstadoProducto(rs.getBoolean(8));
				p.setStockProducto(rs.getInt(9));
				
				System.out.println("Se encontró el producto");
				
			}
		}catch(Exception e) {
			System.out.println("Error en la consulta del producto "+e.getMessage());
		}
		finally {
			con.close();
		}
		
		return p;
	}
	
	public int actualizar(Producto pr) throws SQLException {
		sql="UPDATE producto SET idCategoriaFK=?,idProveedorFK=?, nombreProducto=?, precioProducto=?,descripcionProducto=?,imagenProducto=? , estadoProducto=?, stockProducto=? "+
				"WHERE idProducto="+pr.getIdProducto();
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			ps.setInt(1, pr.getIdCategoriaFK().getIdCategoria());
			ps.setInt(2, pr.getIdProveedorFK().getIdProveedor());
			ps.setString(3, pr.getNombreProducto());
			ps.setDouble(4, pr.getPrecioProducto());
			ps.setString(5, pr.getDescripcionProducto());
			ps.setString(6, pr.getImagenProducto());
			ps.setBoolean(7, pr.isEstadoProducto());
			ps.setInt(8, pr.getStockProducto());
			

			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualizó un producto");
		}catch(Exception e) {
			System.out.println("Error en la actualización del producto "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}

	public int cambiarEstado(Boolean es, int id) throws SQLException {
		sql="UPDATE producto SET estadoProducto=" + es +
				" WHERE idProducto=" + id;
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			/*ps.setBoolean(1, u.isEstadoUsuario());*/
			
			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			
			/*ps.close();//cerrar sentencia*/
			
			System.out.println("Se actualizó el estado del producto");
		}catch(Exception e) {
			System.out.println("Error en la actualización del estado producto "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}

		
}