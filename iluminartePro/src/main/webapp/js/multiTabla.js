var myTable = document.querySelector("#datat");

var dataTable = new DataTable("#datat", {
	perPage:5,
	labels: {
	    placeholder: "Buscar por Campo...",
	    perPage: "{select} Registros por pagina",
	    noRows: "No se encontraron registros",
	    info: "Mostrando {start} a {end} de {rows} registros",
	},
	sortable:true

});