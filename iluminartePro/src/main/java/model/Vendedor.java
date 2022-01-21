package model;

public class Vendedor{
	
	private int idVendedor;
	private String tipoVendedor;
	private Usuario idUsuarioFK;
	public Vendedor(int idVendedor, String tipoVendedor,
			Usuario idUsuarioFK) {
		super();
		this.idVendedor = idVendedor;
		this.tipoVendedor = tipoVendedor;
		this.idUsuarioFK = idUsuarioFK;
	}
	public Vendedor() {
		// TODO Auto-generated constructor stub
	}
	public int getIdVendedor() {
		return idVendedor;
	}
	public void setIdVendedor(int idVendedor) {
		this.idVendedor = idVendedor;
	}
	public String getTipoVendedor() {
		return tipoVendedor;
	}
	public void setTipoVendedor(String tipoVendedor) {
		this.tipoVendedor = tipoVendedor;
	}
	public Usuario getIdUsuarioFK() {
		return idUsuarioFK;
	}
	public void setIdUsuarioFK(Usuario idUsuarioFK) {
		this.idUsuarioFK = idUsuarioFK;
	}
	public static Vendedor parseVendedor(int i) {
		// TODO Auto-generated method stub
		return null;
	}
	



}
