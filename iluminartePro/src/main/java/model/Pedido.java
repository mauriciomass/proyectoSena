package model;

import java.util.Date;

public class Pedido {
	
	private int idPedido;
	private String descripcionPedido;
	private String estadoPedido;
	private  Date fechaPedido;
	private int totalPedido;
	private boolean realizaCompraPedido;
	private Cliente idClienteFK;
	private Vendedor idVendedorFK;
	public Pedido(int idPedido, String descripcionPedido, String estadoPedido, Date fechaPedido, int totalPedido,
			boolean realizaCompraPedido,Cliente idClienteFK, Vendedor idVendedorFK) {
		super();
		this.idPedido = idPedido;
		this.descripcionPedido = descripcionPedido;
		this.estadoPedido = estadoPedido;
		this.fechaPedido = fechaPedido;
		this.totalPedido = totalPedido;
		this.idClienteFK = idClienteFK;
		this.idVendedorFK = idVendedorFK;
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
	public String getEstadoPedido() {
		return estadoPedido;
	}
	public void setEstadoPedido(String estadoPedido) {
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
	public Cliente getIdClienteFK() {
		return idClienteFK;
	}
	public void setIdClienteFK(Cliente idClienteFK) {
		this.idClienteFK = idClienteFK;
	}
	public Vendedor getIdVendedorFK() {
		return idVendedorFK;
	}
	public void setIdVendedorFK(Vendedor idVendedorFK) {
		this.idVendedorFK = idVendedorFK;
	}
	

	

	

}
