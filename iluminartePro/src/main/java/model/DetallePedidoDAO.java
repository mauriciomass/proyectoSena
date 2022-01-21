package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DetallePedidoDAO {
	
	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;
	
	public int guardarDetalleventas(DetallePedido venta) throws SQLException {
		String sql="insert into detallePedido (idPedidoFK,idProductoFK,cantidadDetallePedido,precioDetallePedido) values(?,?,?,?)";
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			
			ps.setInt(1,venta.getIdPedidoFK());
			ps.setInt(2,venta.getIdProductoFK());
			ps.setInt(3,venta.getCantidadDetallePedido());
			ps.setDouble(4,venta.getPrecioDetallePedido());
			
			System.out.println("consulta " + ps);
			
			ps.executeUpdate();
			//procesamos el resultado de la consulta

			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa de guardar detalle pedido");
		}catch(Exception e) {
			System.out.println("No se puede hacer la consulta de guardar detalle pedido "+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
	
		
		return r;
	}

}
