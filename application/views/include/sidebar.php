<div class="left-sidebar" id="show-nav">
    <ul id="side" class="side-nav">
        <li class="panel">
            <a href="<?=base_url();?>"> <i class="fa fa-dashboard"></i> Dashboard</a>
        </li>
        
        
        <?php if($this->logged['designation']=='Admin') { ?>
            
            <!-- <li class="panel">
                <a id="panel3" href="javascript:;" data-toggle="collapse" data-target="#calendar"> <i class="fa fa-calendar"></i> Expense
                <i class="fa fa-chevron-left pull-right" id="arow3"></i> </a>
                <ul class="collapse nav" id="calendar">
                <li> <a href="<?=base_url('auth/exploreData/expense_category/expense-category'); ?>"><i class="fa fa-angle-double-right"></i> Date Category</a> </li>
                <li> <a href="<?=base_url('auth/expenseManagement'); ?>"><i class="fa fa-angle-double-right"></i> Expense Entry</a> </li>
                <li> <a href="<?= base_url('auth/dailyReport/today'); ?>"><i class="fa fa-angle-double-right"></i> Expense Report</a> </li>
                </ul>
            </li> -->
            
            
            <li class="panel">
                <a id="" href="<?=base_url('auth/laundry_management'); ?>">
                <i class="fa fa-users"></i> Laundry Management</a>
            </li>
            
            <li class="panel">
                <a id="" href="<?=base_url('auth/category_management'); ?>">
                <i class="fa fa-list"></i> Category Management</a>
            </li>
            
            <li class="panel">
                <a id="" href="<?=base_url('auth/unit_management'); ?>">
                <i class="fa fa-balance-scale"></i> Unit Management</a>
            </li>
            
            <!-- <li class="panel">
                <a id="" href="<?=base_url('auth/product_management'); ?>">
                <i class="fa fa-list"></i> Product Management</a>
            </li> -->
            <li class="panel">
                <a id="" href="<?=base_url('Auth/today_booking');?>">
                <i class="fa fa-ticket"></i> Today Booking</a>
            </li>
            <li class="panel">
                <a id="" href="<?=base_url('Auth/laundry_booking');?>">
                <i class="fa fa-ticket"></i> All Booking</a>
            </li>
            
            <li class="panel">
                <a id="" href="<?=base_url('Auth/customer_management');?>">
                <i class="fa fa-user"> </i> All Customer</a>
            </li>
            
            <li class="panel">
                <a id="" href="<?=base_url('Auth/changePassword');?>">
                <i class="fa fa-user-secret"></i> Change Password</a>
            </li>
            <?php } else { ?>
            
            
            <li class="panel">
                
                <a id="" href="<?=base_url('user/product_management'); ?>">
                <i class="fa fa-product-hunt"></i> Product Management</a>
            </li> 
            
            <li class="panel">
                
                <a id="" href="<?=base_url('user/laundry_banner'); ?>">
                <i class="fa fa-image"></i> Banner Management</a>
            </li> 
            
            <li class="panel">
                <a id="" href="<?=base_url('user/laundry_date'); ?>">
                <i class="fa fa-calendar"></i> Date Management</a>
            </li>
            
            <li class="panel">
                <a id="" href="<?=base_url('user/today_booking'); ?>">
                <i class="fa fa-list"></i> Today Booking</a>
            </li>   
            <li class="panel">
                <a id="" href="<?=base_url('user/all_booking'); ?>">
                <i class="fa fa-list"></i> All Booking</a>
            </li> 
            <li class="panel">
                <a id="" href="<?=base_url('user/cancle_booking'); ?>">
                <i class="fa fa-list"></i> Cancelled Booking</a>
            </li> 
            
            <li class="panel">
                <a id="" href="<?=base_url('user/laundry_rider'); ?>">
                <i class="fa fa-motorcycle"></i> Rider Management</a>
            </li> 
            
            
        <?php } ?>
        
        
        <li class="panel">
            <a id="" href="<?=base_url('stable/logout');?>" >
            <i class="fa fa-sign-out"></i> Signout</a>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#panel1").click(function() {
            $("#arow1").toggleClass("fa-chevron-left");
            $("#arow1").toggleClass("fa-chevron-down");
        });
        
        $("#panel2").click(function() {
            $("#arow2").toggleClass("fa-chevron-left");
            $("#arow2").toggleClass("fa-chevron-down");
        });
        
        $("#panel3").click(function() {
            $("#arow3").toggleClass("fa-chevron-left");
            $("#arow3").toggleClass("fa-chevron-down");
        });
        
        $("#panel4").click(function() {
            $("#arow4").toggleClass("fa-chevron-left");
            $("#arow4").toggleClass("fa-chevron-down");
        });
        
        $("#panel5").click(function() {
            $("#arow5").toggleClass("fa-chevron-left");
            $("#arow5").toggleClass("fa-chevron-down");
        });
        
        $("#panel6").click(function() {
            $("#arow6").toggleClass("fa-chevron-left");
            $("#arow6").toggleClass("fa-chevron-down");
        });
        
        $("#panel7").click(function() {
            $("#arow7").toggleClass("fa-chevron-left");
            $("#arow7").toggleClass("fa-chevron-down");
        });
        
        $("#panel8").click(function() {
            $("#arow8").toggleClass("fa-chevron-left");
            $("#arow8").toggleClass("fa-chevron-down");
        });
        
        $("#panel9").click(function() {
            $("#arow9").toggleClass("fa-chevron-left");
            $("#arow9").toggleClass("fa-chevron-down");
        });
        
        $("#panel10").click(function() {
            $("#arow10").toggleClass("fa-chevron-left");
            $("#arow10").toggleClass("fa-chevron-down");
        });
        
        $("#panel11").click(function() {
            $("#arow11").toggleClass("fa-chevron-left");
            $("#arow11").toggleClass("fa-chevron-down");
        });
        
        
        $("#menu-icon").click(function() {
            $("#chang-menu-icon").toggleClass("fa-bars");
            $("#chang-menu-icon").toggleClass("fa-times");
            $("#show-nav").toggleClass("hide-sidebar");
            $("#show-nav").toggleClass("left-sidebar");
            
            $("#left-container").toggleClass("less-width");
            $("#right-container").toggleClass("full-width");
        });
        
        
        
    });
</script>                            