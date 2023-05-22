<?php 
	
	$booking_row = $booking->row();
?>
<div class="row">
	<input type="hidden" name="book_id" id="book_id" value="<?= $booking_row->id ?>">
	<div class="col-md-12">
		<h5>Select Status</h5>
		<select id="book_status" name="book_status" class="col-md-12 form-control input-sm">
			<?php foreach ($status_list->result_array() as $key => $value): 
				
				if ($booking_row->booking_status == $value['type_id'] || ($booking_row->booking_status+1) ==  $value['type_id'] && ( $booking_row->booking_status != 8 ) ||  ( $booking_row->booking_status <3 && $value['type_id']==9)) {
					
					
				?>
				<option value="<?= $value['type_id']?>" <?=($booking_row->booking_status == $value['type_id'])?"selected":"" ?> ><?= $value['type']?></option>
				<?php 
				}
			endforeach ?>
			
		</select>
		<br>
		<div id="pickup_boy_div" style="<?=($booking_row->booking_status==2)?'':'display:none;'?>">
			<h5>Select Pickup Boy</h5>
			<select id="pick_up_boy" name="pick_up_boy" class="col-md-12 form-control input-sm">
				<option value=""  >Select Pickup Boy</option>
				
				<?php foreach ($rider_lists->result_array() as $key => $rider_list): ?>
				
				<option value="<?= $rider_list['id']?>" <?=($booking_row->pickup_boy_id == $rider_list['id'])?"selected":"" ?> ><?= $rider_list['rider_name']?> - (<?= $rider_list['rider_mobile_no']?>)</option>
				<?php endforeach ?>
				
			</select>
			<br>
		</div>
		<div id="drop_boy_div" style="<?=($booking_row->booking_status==7)?'':'display:none;'?>">
			<h5>Select Drop Boy</h5>
			<select id="drop_boy" name="drop_boy" class="col-md-12 form-control input-sm" >
				<option value=""  >Select Drop Boy</option>
				
				<?php foreach ($rider_lists->result_array() as $key => $rider_list): ?>
				
				<option value="<?= $rider_list['id']?>" <?=($booking_row->drop_boy_id == $rider_list['id'])?"selected":"" ?> ><?= $rider_list['rider_name']?> - (<?= $rider_list['rider_mobile_no']?>)</option>
				<?php endforeach ?>
				
			</select>
			
			<br>
		</div>
		<br><br>
		
	</div>
</div>


<button type="button" data-dismiss="modal" onclick="order_status()" id="sbbtn" class="btn btn-sm btn-success">Update</button>
<button type="button" data-dismiss="modal" class="btn btn-sm btn-danger" id="btnclose">Close</button>


<script type="text/javascript">	
	$('#book_status').on('change', function() {		
		console.log(this.value);
		$( "#pickup_boy_div" ).hide();
		$( "#drop_boy_div" ).hide();
		if (this.value==2) {
			$( "#pickup_boy_div" ).show();	
		}
		if (this.value==7) {
			$( "#drop_boy_div" ).show();	
		}
	});
</script>