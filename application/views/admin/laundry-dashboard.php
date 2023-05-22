<!DOCTYPE html>
<html lang="en">
<head>
 <title><?=SITE_TITLE;?> | <?=SITE_TITLE;?><?=$page['page']='Laundry Dashboard';?></title>
 <?php $this->load->view('include/header'); ?>
 <link rel="stylesheet" type="text/css" href="<?=base_url('assets/css/front-dashboard.css'); ?>">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>
<body>
  <!--===========top nav start=======-->
  <?php $this->load->view('include/topbar'); ?>
  <!--===========top nav end===========-->
  <div class="wrapper" id="wrapper">
   <div class="left-container" id="left-container">

    <?php
    $page['link_page']= [
     "Laundry Management"=>base_url()."auth/laundry_management"
   ];
   ?>

   <!--========== Sidebar Start =============-->
   <?php $this->load->view('include/sidebar',$page); ?>
   <!--========== Sidebar End ===============-->
 </div>
 <div class="right-container" id="right-container">
  <div class="container-fluid">
    <?php $this->load->view('include/page-top',$page); ?>
    <!--//===============Main Container Start=============//-->
    <div class="row padding-top">
      <?php
      //  print_r($laundry->row());
      ?>
      <div class="col-lg-3 col-xs-6">
        <div class="circle-tile ">
          <a href="javascript:void(0);"><div class="circle-tile-heading green" id="head-tile"><i class="fa fa-check fa-fw fa-3x"></i></div></a>
          <div class="circle-tile-content green">
            <div class="circle-tile-description text-faded">Status</div>
            <h3 class="tile-head">
              <?php if ($laundry->row()->vendor_status==0): ?>
                De-Active
              <?php else:

              ?>Active
            <?php endif ?>
          </h3>
          <a class="circle-tile-footer" href=""> <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading blue" id="head-tile"><i class="fa fa-first-order fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content blue">
          <div class="circle-tile-description text-faded"> Today Order</div>

          <h3 class="tile-head"><?php laundry_today_order($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_today_booking/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading yellow" id="head-tile"><i class="fa fa-first-order fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content yellow">
          <div class="circle-tile-description text-faded"> Total Order</div>

          <h3 class="tile-head"><?php laundry_total_order($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_all_booking/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading green" id="head-tile"><i class="fa fa-product-hunt fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content green">
          <div class="circle-tile-description text-faded"> All Product</div>

          <h3 class="tile-head"><?php laundry_product($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_product/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href=""><div class="circle-tile-heading lightseagreen" id="head-tile"><i class="fa fa-motorcycle fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content lightseagreen">
          <div class="circle-tile-description text-faded"> Total Rider </div>

          <h3 class="tile-head"><?php laundry_total_rider($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_rider/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading mediumseagreen" id="head-tile"><i class="fa fa-motorcycle fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content mediumseagreen">
          <div class="circle-tile-description text-faded"> Active Rider</div>

          <h3 class="tile-head"><?php laundry_active_rider($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_rider/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>


    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading red" id="head-tile"><i class="fa fa-motorcycle fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded"> De- Active Rider</div>

          <h3 class="tile-head"><?php laundry_deactive_rider($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_rider/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading blue" id="head-tile"><i class="fa fa-picture-o fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content blue">
          <div class="circle-tile-description text-faded"> All Banner</div>

          <h3 class="tile-head"><?php laundry_banner($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_banner/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href="javascript:void(0);"><div class="circle-tile-heading yellow" id="head-tile"><i class="fa fa-calendar fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content yellow">
          <div class="circle-tile-description text-faded"> Date Managment</div>

          <h3 class="tile-head"><?php laundry_date($laundry->row()->id); ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_date/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-xs-6">
      <div class="circle-tile ">
        <a href=""><div class="circle-tile-heading lightseagreen" id="head-tile"><i class="fa fa-money fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content lightseagreen">
          <div class="circle-tile-description text-faded"> Wallet </div>

          <h3 class="tile-head"><?= $laundry->row()->wallet_balance ?></h3>
          <a class="circle-tile-footer" href="<?=base_url('auth/laundry_wallet/'.$laundry->row()->id.'');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>

  </div>


  <!--//===============Main Container End=============//-->
</div>
</div>
</div>
<!--==========Footer Start=============-->
<?php $this->load->view('include/footer'); ?>
<!--==========Footer End=============-->
</body>
</html>
<style type="text/css">
  #news-panel{
    height: 335px;
  }
</style>
<!-- Bootstrap Modal for Notice -->
<div class="modal fade" id="noticeModal" role="dialog">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-body" style="padding: 0px;">
        <div class="panel panel-primary" style="margin-bottom: 0px;">
          <div class="panel-heading">
           <p class="panel-title">Notice
             <button type="button" class="close pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button></p>
           </div>
           <div class="panel-body">
            <div class="list-group">
              <a href="#" class="list-group-item"><small>Issue Date : <span class="txtred" id="noticeDate"></span></small></a>
              <a href="#" class="list-group-item"><b>Message : </b><p id="notice"></p></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal End -->
<script type="text/javascript">


</script>
<style type="text/css">
  .morris-hover {
    position:absolute;
    z-index:1000;
  }

  .morris-hover.morris-default-style {     border-radius:10px;
    padding:6px;
    color:#666;
    background:rgba(255, 255, 255, 0.8);
    border:solid 2px rgba(230, 230, 230, 0.8);
    font-family:sans-serif;
    font-size:12px;
    text-align:center;
  }

  .morris-hover.morris-default-style .morris-hover-row-label {
    font-weight:bold;
    margin:0.25em 0;
  }

  .morris-hover.morris-default-style .morris-hover-point {
    white-space:nowrap;
    margin:0.1em 0;
  }

  svg { width: 100%; }
</style>
