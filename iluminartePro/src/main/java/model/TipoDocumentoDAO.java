package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoDocumentoDAO {

	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;

	public List listarTipoDocumentos() throws SQLException {
		List<TipoDocumento> tipos=new ArrayList<>();
		sql="SELECT *FROM tipoDocumento";
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta
			while(rs.next()) {
				TipoDocumento r=new TipoDocumento();
				//Escribir en el setter de cada objeto
				r.setIdTipoDocumento(rs.getInt("idTipoDocumento"));
				r.setNombreTipoDocumento(rs.getString("nombreTipoDocumento"));
							
				tipos.add(r);
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa");
		}catch(Exception e) {
			System.out.println("No existen tipos de documentos definidos"+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return tipos;
	}

}