jQuery -> 
	$('#pedido_material_id').parent().hide()
	materials = $('#pedido_material_id').html()
	$('#pedido_trabajo_id').change ->
		trabajo = $('#pedido_trabajo_id :selected').text()
		escaped_trabajo = trabajo.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
		options = $(materials).filter("optgroup[label='#{escaped_trabajo}']").html()
		if options
			$('#pedido_material_id').html(options)
			$('#pedido_material_id').parent().show()
		else
			$('#pedido_material_id').empty()
			$('#pedido_material_id').parent().hide()