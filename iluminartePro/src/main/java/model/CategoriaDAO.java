package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {
/*Se requieren atributos para realizar las operaciones*/
	
	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;

	
	public List listarCategoria() throws Exception{
		
		List<Categoria> categoria=new ArrayList<>();
		sql="SELECT *FROM categoria";
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta
			while(rs.next()) {
				Categoria r=new Categoria();
				//Escribir en el setter de cada objeto
				r.setIdCategoria(rs.getInt("idCategoria"));
				r.setNombreCategoria(rs.getString("nombreCategoria"));
				r.setDescripcionCategoria(rs.getString("descripcionCategoria"));
				r.setEstadoCategoria(rs.getBoolean("estadoCategoria"));
								
				categoria.add(r);
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa");
		}catch(Exception e) {
			System.out.println("No existen categoria"+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return categoria;
	}
	
	public int registrarCategoria(Categoria categoria) throws SQLException {
		sql="INSERT INTO categoria (nombreCategoria,descripcionCategoria,estadoCategoria) VALUES (?,?,?)";
		try {
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			ps.setString(1, categoria.getNombreCategoria());
			ps.setString(2, categoria.getDescripcionCategoria());
			ps.setBoolean(3, categoria.getEstadoCategoria());
			
			System.out.println(sql);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se registró una Categoria");
			
		}catch(Exception e) {
			System.out.println("Error en el registro de una Categoria"+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	public void eliminarCategoria(int idCategoria) throws SQLException {
		sql="DELETE FROM categoria WHERE idCategoria="+idCategoria;
		System.out.println(sql);
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
			System.out.println("Se eliminó la Categoria");
		}catch(Exception e) {
			System.out.println("Error en la eliminación del registro de una Categoria "+e.getMessage());
		}
		finally {
			con.close();
		}
	}
	
	public Categoria consultaporIdCategoria(int idCategoria) throws SQLException {
		Categoria ro=new Categoria();
		sql="SELECT * from categoria WHERE idCategoria="+idCategoria;
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ro.setIdCategoria(rs.getInt("idCategoria"));
				ro.setNombreCategoria(rs.getString("nombreCategoria"));
				ro.setDescripcionCategoria(rs.getString("descripcionCategoria"));
				ro.setEstadoCategoria(rs.getBoolean("estadoCategoria"));
				
				System.out.println("Se encontró la Categoria");
				
			}
		}catch(Exception e) {
			System.out.println("Error en la consulta de una Categoria "+e.getMessage());
		}
		finally {
			con.close();
		}
		
		return ro;
	}
	
	public int actualizarCategoria(Categoria categoria) throws SQLException {
		sql="UPDATE categoria SET nombreCategoria=?,descripcionCategoria=?, estadoCategoria=? "+
				"WHERE idCategoria="+categoria.getIdCategoria();
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			ps.setString(1, categoria.getNombreCategoria());
			ps.setString(2, categoria.getDescripcionCategoria());
			ps.setBoolean(3, categoria.getEstadoCategoria());
			
			
			System.out.println(sql);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualizó una Categoria");
		}catch(Exception e) {
			System.out.println("Error en la actualización de una Categoria "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	public int cambiarEstado(Categoria categoria) throws SQLException {
		sql="UPDATE categoria SET estadoCategoria=? "+
				"WHERE idCategoria="+categoria.getIdCategoria();
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			ps.setBoolean(1, categoria.getEstadoCategoria());
			
			System.out.println(sql);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualizó el estado de la Categoria");
		}catch(Exception e) {
			System.out.println("Error en la actualización del estado de la Categoria "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}			
}