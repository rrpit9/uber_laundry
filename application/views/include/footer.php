<script src="<?=base_url('assets/js/bootstrap.min.js');?>"></script>
<script src="<?=base_url('assets/js/jquery.dataTables.min.js');?>"></script>
<script src="<?=base_url('assets/js/dataTables.bootstrap.min.js');?>"></script>
<script src="<?=base_url('assets/js/bootstrap-datepicker.js'); ?>"></script>
<script type="text/javascript" src="<?=base_url('assets/js/templatemo-script.js'); ?>"></script>
<script src="<?=base_url('assets/js/myscript.js'); ?>"></script>



<?php if($this->logged['designation']=='Admin') { ?>
	<script src="<?=base_url('assets/js/admin-script.js'); ?>"></script>
	
	<?php } else { ?>
	<script src="<?=base_url('assets/js/laundry-scripts.js'); ?>"></script>
<?php } ?>