package model;

public class Usuario {

	private int idUsuario;
	private String nombreUsuario, apellidoUsuario,contrasenaUsuario,numerodeIdentificacionUsuario,direccionUsuario,
	               telefonoUsuario,correoUsuario,numeroUsuario;
	private Boolean estadoUsuario;
	private TipoDocumento idTipodeDocumentoFK;
	private TipoRol idRolFK;
	public Usuario(int idUsuario, String nombreUsuario, String apellidoUsuario, String contrasenaUsuario,
			String numerodeIdentificacionUsuario, String direccionUsuario, String telefonoUsuario, String correoUsuario,
			boolean estadoUsuario, TipoDocumento idTipodeDocumentoFK, TipoRol idRolFK,String numeroUsuario) {
		super();
		this.idUsuario = idUsuario;
		this.nombreUsuario = nombreUsuario;
		this.apellidoUsuario = apellidoUsuario;
		this.contrasenaUsuario = contrasenaUsuario;
		this.numerodeIdentificacionUsuario = numerodeIdentificacionUsuario;
		this.direccionUsuario = direccionUsuario;
		this.telefonoUsuario = telefonoUsuario;
		this.correoUsuario = correoUsuario;
		this.estadoUsuario = estadoUsuario;
		this.idTipodeDocumentoFK = idTipodeDocumentoFK;
		this.idRolFK = idRolFK;
		this.numeroUsuario = numeroUsuario;
		
	}
	
	public String numeroIdentificacion(String numerodeIdentificacionUsuario) {
		return this.numerodeIdentificacionUsuario = numerodeIdentificacionUsuario;
	}
	
	
	public String getDireccionUsuario() {
		return direccionUsuario;
	}
	public void setDireccionUsuario(String direccionUsuario) {
		this.direccionUsuario = direccionUsuario;
	}
	public Usuario() {
		// TODO Auto-generated constructor stub
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getApellidoUsuario() {
		return apellidoUsuario;
	}
	public void setApellidoUsuario(String apellidoUsuario) {
		this.apellidoUsuario = apellidoUsuario;
	}
	public String getContrasenaUsuario() {
		return contrasenaUsuario;
	}
	public void setContrasenaUsuario(String contrasenaUsuario) {
		this.contrasenaUsuario = contrasenaUsuario;
	}
	public String getNumerodeIdentificacionUsuario() {
		return numerodeIdentificacionUsuario;
	}
	public void setNumerodeIdentificacionUsuario(String numerodeIdentificacionUsuario) {
		this.numerodeIdentificacionUsuario = numerodeIdentificacionUsuario;
	}

	public String getTelefonoUsuario() {
		return telefonoUsuario;
	}
	public void setTelefonoUsuario(String telefonoUsuario) {
		this.telefonoUsuario = telefonoUsuario;
	}
	public String getCorreoUsuario() {
		return correoUsuario;
	}
	public void setCorreoUsuario(String correoUsuario) {
		this.correoUsuario = correoUsuario;
	}
	public Boolean isEstadoUsuario() {
		return estadoUsuario;
	}
	public void setEstadoUsuario(Boolean estadoUsuario) {
		this.estadoUsuario = estadoUsuario;
	}
	public TipoDocumento getIdTipodeDocumentoFK() {
		return idTipodeDocumentoFK;
	}
	public void setIdTipodeDocumentoFK(TipoDocumento idTipodeDocumentoFK) {
		this.idTipodeDocumentoFK = idTipodeDocumentoFK;
	}
	public TipoRol getIdRolFK() {
		return idRolFK;
	}
	public void setIdRolFK(TipoRol idRolFK) {
		this.idRolFK = idRolFK;
	}

	public String getIdRolFKRep() {
		return this.idRolFK !=null ? this.idRolFK.getNombreRol() : "--";
	}
	
	public String getEstadoUsuarioRep() {
		return this.estadoUsuario ? "Activo" : "Inactivo";
	}

	public String getNumeroUsuario() {
		return numeroUsuario;
	}

	public String setNumeroUsuario(String numeroUsuario) {
		return this.numeroUsuario = numeroUsuario;
	}
	
	
}
