package model;

public class Administrador  extends Usuario{
	
	
	private int idAdministrdor;	
	private Usuario idUsuarioFK;
	public Administrador(int idUsuario, String nombreUsuario, String apellidoUsuario, String contrasenaUsuario,
			String numerodeIdentificacionUsuario, String direecionUsuario, String telefonoUsuario, String correoUsuario,
			int estadoUsuario, int idTipodeDocumentoFK, int idRolFK, int idAdministrdor, Usuario idUsuarioFK) {
		super(idUsuario, nombreUsuario, apellidoUsuario, contrasenaUsuario, numerodeIdentificacionUsuario,
				direecionUsuario, telefonoUsuario, correoUsuario, estadoUsuario, idTipodeDocumentoFK, idRolFK);
		this.idAdministrdor = idAdministrdor;
		this.idUsuarioFK = idUsuarioFK;
	}
	public int getIdAdministrdor() {
		return idAdministrdor;
	}
	public void setIdAdministrdor(int idAdministrdor) {
		this.idAdministrdor = idAdministrdor;
	}
	public Usuario getIdUsuarioFK() {
		return idUsuarioFK;
	}
	public void setIdUsuarioFK(Usuario idUsuarioFK) {
		this.idUsuarioFK = idUsuarioFK;
	}
	
	


}
