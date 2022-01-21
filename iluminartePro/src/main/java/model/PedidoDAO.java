package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

public class PedidoDAO {
	
	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;
	

	public String GenerarSerie() throws SQLException {
		String numeroserie="";
					    
		sql="SELECT max(numeroSeriePedido) from pedido";
	    	
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta

					
			while(rs.next()) {
				
				numeroserie=rs.getString(1);
				
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa de numero Serie");
		}catch(Exception e) {
			System.out.println("No se puede hacer la consulta de numero de serie "+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return numeroserie;
	}
	
	public String IdVentas() throws SQLException {
		String idventas="";
		String sql="select max(idPedido) from pedido";
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta

					
			while(rs.next()) {
				
				idventas=rs.getString(1);
				
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa de numero Serie");
		}catch(Exception e) {
			System.out.println("No se puede hacer la consulta de numero de serie "+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return idventas;
	}

	public int guardarVenta(Pedido ve) throws SQLException {

			
		sql="insert into pedido(idClienteFK,idVendedorFK,descripcionPedido,estadoPedido,fechaPedido,realizaCompraPedido,numeroSeriePedido,montoPedido) values(?,?,?,?,?,?,?,?) ";
		
		System.out.println("entro por dao guardar venta");
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			
			ps.setInt(1,ve.getIdClienteFK());
			ps.setInt(2,ve.getIdVendedorFK());
			
			/*ps.setInt(1,1);
			ps.setInt(2,1);	*/		
			ps.setString(3,ve.getDescripcionPedido());
			ps.setBoolean(4,ve.getEstadoPedido());
			ps.setDate(5,(Date) ve.getFechaPedido());
			ps.setBoolean(6,ve.isRealizaCompraPedido());
			ps.setString(7,ve.getNumeroSeriePedido());
			ps.setDouble(8,ve.getMontoPedido());
			
			System.out.println("consulta " + ps);
			
			ps.executeUpdate();
			//procesamos el resultado de la consulta

			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa de guardar Pedido");
		}catch(Exception e) {
			System.out.println("No se puede hacer la consulta de guardar Pedido "+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return r;
	}


}
