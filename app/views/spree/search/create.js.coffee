$("#resultados").html("<%= j render @pedido %>");
$('#paginator').html('<%= escape_javascript(paginate(@pedido, :remote => true).to_s) %>');
