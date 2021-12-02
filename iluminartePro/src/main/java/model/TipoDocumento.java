package model;

public class TipoDocumento {
	
	private int idTipoDocumento;	
	private String nombreTipoDocumento;
	public TipoDocumento(int idTipoDocumento, String nombreTipoDocumento) {
		super();
		this.idTipoDocumento = idTipoDocumento;
		this.nombreTipoDocumento = nombreTipoDocumento;
	}
	public TipoDocumento() {
		// TODO Auto-generated constructor stub
	}
	public int getIdTipoDocumento() {
		return idTipoDocumento;
	}
	public void setIdTipoDocumento(int idTipoDocumento) {
		this.idTipoDocumento = idTipoDocumento;
	}
	public String getNombreTipoDocumento() {
		return nombreTipoDocumento;
	}
	public void setNombreTipoDocumento(String nombreTipoDocumento) {
		this.nombreTipoDocumento = nombreTipoDocumento;
	}	
	
	
	

}
