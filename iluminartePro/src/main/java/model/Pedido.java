package model;

import java.util.Date;

public class Pedido {
	
	private int idPedido;
	private String descripcionPedido;
	private boolean estadoPedido;
	private  Date fechaPedido;
	private int totalPedido;
	private boolean realizaCompraPedido;
	private String numeroSeriePedido;
	private int idClienteFK;
	private int idVendedorFK;
	private Cliente idClienteFK2;
	private Vendedor idVendedorFK2;
	
	private int item;
	
	private Double precio;
	
	private int cantidad;
	
	private Double subtotal;
	
	private Double montoPedido;
	
	private String CodProducto;
	
	private int idProducto;
	
	
	public Pedido(int idPedido, String descripcionPedido, boolean estadoPedido, Date fechaPedido, int totalPedido,
			boolean realizaCompraPedido,String numeroSeriePedido,int idClienteFK, int idVendedorFK, int item,Double precio, int cantidad,
			Double subtotal, Double montoPedido,String CodProducto,Cliente idClienteFK2,Vendedor idVendedorFK2,int idProducto) {
		super();
		this.idPedido = idPedido;
		this.descripcionPedido = descripcionPedido;
		this.estadoPedido = estadoPedido;
		this.fechaPedido = fechaPedido;
		this.totalPedido = totalPedido;
		this.numeroSeriePedido = numeroSeriePedido;
		this.idClienteFK = idClienteFK;
		this.idVendedorFK = idVendedorFK;
		this.item = item;
		this.precio = precio;
		this.cantidad = cantidad;
		this.subtotal = subtotal;
		this.montoPedido = montoPedido;
		this.CodProducto = CodProducto;
		this.idClienteFK2 = idClienteFK2;
		this.idVendedorFK2 = idVendedorFK2;
		this.idProducto = idProducto;
	}
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	public Cliente getIdClienteFK2() {
		return idClienteFK2;
	}
	public void setIdClienteFK2(Cliente idClienteFK2) {
		this.idClienteFK2 = idClienteFK2;
	}
	public Vendedor getIdVendedorFK2() {
		return idVendedorFK2;
	}
	public void setIdVendedorFK2(Vendedor idVendedorFK2) {
		this.idVendedorFK2 = idVendedorFK2;
	}
	public Pedido() {
		// TODO Auto-generated constructor stub
	}
	public int getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	public String getDescripcionPedido() {
		return descripcionPedido;
	}
	public void setDescripcionPedido(String descripcionPedido) {
		this.descripcionPedido = descripcionPedido;
	}
	public boolean getEstadoPedido() {
		return estadoPedido;
	}
	public void setEstadoPedido(boolean estadoPedido) {
		this.estadoPedido = estadoPedido;
	}
	public Date getFechaPedido() {
		return fechaPedido;
	}
	public void setFechaPedido(Date fechaPedido) {
		this.fechaPedido = fechaPedido;
	}
	public int getTotalPedido() {
		return totalPedido;
	}
	public void setTotalPedido(int totalPedido) {
		this.totalPedido = totalPedido;
	}
	
	
	public boolean isRealizaCompraPedido() {
		return realizaCompraPedido;
	}
	public void setRealizaCompraPedido(boolean realizaCompraPedido) {
		this.realizaCompraPedido = realizaCompraPedido;
	}
	
	public String getNumeroSeriePedido() {
		return numeroSeriePedido;
	}
	public void setNumeroSeriePedido(String numeroSeriePedido) {
		this.numeroSeriePedido = numeroSeriePedido;
	}
	public int getIdClienteFK() {
		return idClienteFK;
	}
	public void setIdClienteFK(int idClienteFK) {
		this.idClienteFK = idClienteFK;
	}
	public int getIdVendedorFK() {
		return idVendedorFK;
	}
	public void setIdVendedorFK(int i) {
		this.idVendedorFK = i;
	}
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Double getMontoPedido() {
		return montoPedido;
	}
	public void setMontoPedido(Double montoPedido) {
		this.montoPedido = montoPedido;
	}

	
	public String getCodProducto() {
		return CodProducto;
	}
	public void setCodProducto(String codProducto) {
		CodProducto = codProducto;
	}
	@Override
	public String toString() {
		return "Pedido [idPedido=" + idPedido + ", descripcionPedido=" + descripcionPedido + ", estadoPedido="
				+ estadoPedido + ", fechaPedido=" + fechaPedido + ", totalPedido=" + totalPedido
				+ ", realizaCompraPedido=" + realizaCompraPedido + ", numeroSeriePedido=" + numeroSeriePedido
				+ ", idClienteFK=" + idClienteFK + ", idVendedorFK=" + idVendedorFK + ", idClienteFK2=" + idClienteFK2
				+ ", idVendedorFK2=" + idVendedorFK2 + ", item=" + item + ", precio=" + precio + ", cantidad="
				+ cantidad + ", subtotal=" + subtotal + ", montoPedido=" + montoPedido + ", CodProducto=" + CodProducto
				+ ", idProducto=" + idProducto + "]";
	}

		

}
