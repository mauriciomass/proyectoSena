package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Conexion;
import model.Pago;

public class PagoDAO {

	private Connection connection;
	private PreparedStatement statement;
	private boolean estadoOperacion;
	
	
	
	//guardar
	public boolean guardar(Pago pago) throws SQLException {
		String sql=null;
		estadoOperacion=false;
		connection=obtenerConexion();
		
		try {
			connection.setAutoCommit(false);
			sql="INSERT INTO pago (idPago,estadoPago,tipoPago,valorPago,estadoPago,pocentajeIvaPago) VALUES (?,?,?,?,?,?)";
			statement=connection.prepareStatement(sql);
			
			statement.setString(1,null);
			statement.setString(2,pago.getEstadoPago());
			statement.setString(3,pago.getTipoPago());;
			statement.setDouble(4,pago.getValorPago());
			statement.setDouble(5,pago.getPocentajeIvaPago());
			
			estadoOperacion= statement.executeUpdate()>0;
			
			connection.commit();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			connection.rollback();
			e.printStackTrace();
		}
		
		return estadoOperacion;
	}
	
	//editar pago
	public boolean editar(Pago pago) throws SQLException {
		String sql=null;
		estadoOperacion=false;
		connection=obtenerConexion();
		
		try {
			 connection.setAutoCommit(false);
			 sql="UPDATE pago SET estadoPago=?,tipoPago=?,valorPago=?,pocentajeIvaPago=? WHERE idPago=?";
			 statement=connection.prepareStatement(sql);
			 
			 statement.setString(1,pago.getEstadoPago());
			 statement.setString(2,pago.getTipoPago());
			 statement.setDouble(3,pago.getValorPago());
			 statement.setDouble(4,pago.getPocentajeIvaPago());
			 statement.setInt(1,pago.getIdPago());
			 
			 estadoOperacion= statement.executeUpdate()>0;
			 connection.commit();
			 statement.close();
			 connection.close();
			 
			
		}catch (SQLException e) {
			connection.rollback();
			e.printStackTrace();
		}
		
		return estadoOperacion;
	}
	
	//eliminar pago
	public boolean eliminar(int idPago) throws SQLException {
		String sql=null;
		estadoOperacion=false;
		connection=obtenerConexion();
		
		try {
			 connection.setAutoCommit(false);
			 sql="DELETE FROM pago WHERE idPago=?";
			 statement=connection.prepareStatement(sql);
			 statement.setInt(1,idPago);
			 
			 estadoOperacion= statement.executeUpdate()>0;
			 connection.commit();
			 statement.close();
			 connection.close();
			 
			
		}catch (SQLException e) {
			connection.rollback();
			e.printStackTrace();
		}
		
		return estadoOperacion;
	}
	
	//obtener lista de pagos
	public List<Pago> obtenerPagos() throws SQLException {
		ResultSet resultSet=null;
		List<Pago> listaPagos = new ArrayList<>();
		
		String sql=null;
		estadoOperacion=false;
		connection=obtenerConexion();
		
		try	{
			
			sql="SELECT * FROM pago";
			resultSet=statement.executeQuery(sql);
			while (resultSet.next()) {
				Pago p=new Pago();
				p.setIdPago(resultSet.getInt(1));
				p.setEstadoPago(resultSet.getString(2));
				p.setTipoPago(resultSet.getString(3));
				p.setValorPago(resultSet.getDouble(4));
				p.setPocentajeIvaPago(resultSet.getDouble(5));
				listaPagos.add(p);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listaPagos;
	}
	
	//obtener pago
	public Pago obtenerPago(int idPago) throws SQLException {
		ResultSet resultSet=null;
		Pago p=new Pago();
		
		String sql=null;
		estadoOperacion=false;
		connection=obtenerConexion();
		
		try	{
			
			sql="SELECT * FROM pago WHERE idPago=?";
			statement=connection.prepareStatement(sql);
			statement.setInt(1, idPago);
			
			resultSet=statement.executeQuery(sql);
			
			if (resultSet.next()) {				
				p.setIdPago(resultSet.getInt(1));
				p.setEstadoPago(resultSet.getString(2));
				p.setTipoPago(resultSet.getString(3));
				p.setValorPago(resultSet.getDouble(4));
				p.setPocentajeIvaPago(resultSet.getDouble(5));
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return p;
	}
	
	//obtener conexion
	private Connection obtenerConexion() throws SQLException {
		return Conexion.getConnection();
	}
	
}
