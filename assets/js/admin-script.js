var baseUrl = $("#baseurl").val();

function order_action(id)
{
	$('#id').val(id);
	$.ajax(
	{
		type:"POST",
		url: baseUrl +"Auth/order_view",
		data:{'id':id},
		success:function(data){
			$('#allView').html("");
			if(data) {  
				$('#allView').html(data);
			};
		} 
	});
}



function order_status()
{
	$('#sbbtn').hide();
	$('#btnclose').click();
	
    $.ajax({
        type: "POST",
        url: baseUrl +'Auth/update_order_status',
        data: {
            'id': $('#booking_id').val(),
             'book_status': $('#book_status').val(),
             'pick_up_boy': $('#pick_up_boy').val(),
             'drop_boy': $('#drop_boy').val(),
             'book_id': $('#book_id').val()
        },
        success: function(res) {
            window.location.href = window.location.href;
        },
        error: function() {
            alert('error');
        }
    });

}