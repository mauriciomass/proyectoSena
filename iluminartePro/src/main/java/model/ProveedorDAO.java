package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProveedorDAO {
	/*Se requieren atributos para realizar las operaciones*/
	
	Connection con; //objeto de conexi�n
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;

	
	public List listarProveedor() throws Exception{
		
		List<Proveedor> proveedor=new ArrayList<>();
		sql="SELECT *FROM proveedor";
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta
			while(rs.next()) {
				Proveedor r=new Proveedor();
				//Escribir en el setter de cada objeto
				r.setIdProveedor(rs.getInt("idProveedor"));
				r.setNombreProveedor(rs.getString("nombreProveedor"));
				r.setDireccionProveedor(rs.getString("direccionProveedor"));
				r.setTelefonoProveedor(rs.getString("telefonoProveedor"));
				r.setPersonaContactoProveedor(rs.getString("personaContactoProveedor"));
				r.setEstadoProveedor(rs.getBoolean("estadoProveedor"));
				
				proveedor.add(r);
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa");
		}catch(Exception e) {
			System.out.println("No existen proveedores"+e.getMessage());
		}finally {
			con.close(); //cerrar conexi�n
		}
		return proveedor;
	}
	
	public int registrarProveedor(Proveedor proveedor) throws SQLException {
		sql="INSERT INTO proveedor (nombreProveedor,direccionProveedor,telefonoProveedor,personaContactoProveedor,estadoProveedor) VALUES (?,?,?,?,?)";
		try {
			con=c.conectar();//abrir conexi�n
			ps=con.prepareStatement(sql); //preparaci�n
			ps.setString(1, proveedor.getNombreProveedor());
			ps.setString(2, proveedor.getDireccionProveedor());
			ps.setString(3, proveedor.getTelefonoProveedor());
			ps.setString(4, proveedor.getPersonaContactoProveedor());
			ps.setBoolean(5, proveedor.getEstadoProveedor());
			
			System.out.println(sql);
			ps.executeUpdate();//Ejecucuci�n sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se registr� un proveedor");
			
		}catch(Exception e) {
			System.out.println("Error en el registro del Proveedor"+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	public void eliminarProveedor(int idProveedor) throws SQLException {
		sql="DELETE FROM proveedor WHERE idProveedor="+idProveedor;
		System.out.println(sql);
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
			System.out.println("Se elimin� el proveedor");
		}catch(Exception e) {
			System.out.println("Error en la eliminaci�n del registro de Proveedor "+e.getMessage());
		}
		finally {
			con.close();
		}
	}
	
	public Proveedor consultaporIdProveedor(int idProveedor) throws SQLException {
		Proveedor ro=new Proveedor();
		sql="SELECT * from proveedor WHERE idProveedor="+idProveedor;
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ro.setIdProveedor(rs.getInt("idProveedor"));
				ro.setNombreProveedor(rs.getString("nombreProveedor"));
				ro.setDireccionProveedor(rs.getString("direccionProveedor"));
				ro.setTelefonoProveedor(rs.getString("telefonoProveedor"));
				ro.setPersonaContactoProveedor(rs.getString("personaContactoProveedor"));
				ro.setEstadoProveedor(rs.getBoolean("estadoProveedor"));
				
				System.out.println("Se encontr� el proveedor");
				
			}
		}catch(Exception e) {
			System.out.println("Error en la consulta del proveedor "+e.getMessage());
		}
		finally {
			con.close();
		}
		
		return ro;
	}
	
	public int actualizarProveedor(Proveedor proveedor) throws SQLException {
		sql="UPDATE proveedor SET nombreProveedor=?,direccionProveedor=?, telefonoProveedor=?,personaContactoProveedor=?,estadoProveedor=?"+
				" WHERE idProveedor="+proveedor.getIdProveedor();
		try {
			
			con=c.conectar();//abrir conexi�n
			ps=con.prepareStatement(sql); //preparaci�n
			ps.setString(1, proveedor.getNombreProveedor());
			ps.setString(2, proveedor.getDireccionProveedor());
			ps.setString(3, proveedor.getTelefonoProveedor());
			ps.setString(4, proveedor.getPersonaContactoProveedor());
			ps.setBoolean(5, proveedor.getEstadoProveedor());
	
			
			
			System.out.println(sql);
			ps.executeUpdate();//Ejecucuci�n sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualizó un proveedor");
		}catch(Exception e) {
			System.out.println("Error en la actualización del proveedor "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	public int cambiarEstado(Proveedor proveedor) throws SQLException {
		sql="UPDATE proveedor SET estadoProveedor=? "+
				"WHERE idProveedor="+proveedor.getIdProveedor();
		try {
			
			con=c.conectar();//abrir conexi�n
			ps=con.prepareStatement(sql); //preparaci�n
			ps.setBoolean(1, proveedor.getEstadoProveedor());
			
			System.out.println(sql);
			ps.executeUpdate();//Ejecucuci�n sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualiz� el estado del proveedor");
		}catch(Exception e) {
			System.out.println("Error en la actualizaci�n del estado proveedor "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}			
}