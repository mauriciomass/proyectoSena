package model;

public class Cliente  extends Usuario {
	
	private int idCliente;	
	private Usuario idUsuarioFK;
	private Divipola idMubicipioFK;
	
	public Cliente(int idUsuario, String nombreUsuario, String apellidoUsuario, String contrasenaUsuario,
			String numerodeIdentificacionUsuario, String direecionUsuario, String telefonoUsuario, String correoUsuario,
			int estadoUsuario, int idTipodeDocumentoFK, int idRolFK, int idCliente, Usuario idUsuarioFK,
			Divipola idMubicipioFK) {
		super(idUsuario, nombreUsuario, apellidoUsuario, contrasenaUsuario, numerodeIdentificacionUsuario,
				direecionUsuario, telefonoUsuario, correoUsuario, estadoUsuario, idTipodeDocumentoFK, idRolFK);
		this.idCliente = idCliente;
		this.idUsuarioFK = idUsuarioFK;
		this.idMubicipioFK = idMubicipioFK;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public Usuario getIdUsuarioFK() {
		return idUsuarioFK;
	}
	public void setIdUsuarioFK(Usuario idUsuarioFK) {
		this.idUsuarioFK = idUsuarioFK;
	}
	public Divipola getIdMubicipioFK() {
		return idMubicipioFK;
	}
	public void setIdMubicipioFK(Divipola idMubicipioFK) {
		this.idMubicipioFK = idMubicipioFK;
	}
	
	
	
	
	
}
