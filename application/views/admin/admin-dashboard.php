<!DOCTYPE html>
<html lang="en">
<head>
 <title><?=SITE_TITLE;?> | <?=SITE_TITLE;?><?=$page['page']=' Dashboard';?></title>
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
     <!--========== Sidebar Start =============-->
     <?php $this->load->view('include/sidebar',$page); ?>
     <!--========== Sidebar End ===============-->
   </div>
   <div class="right-container" id="right-container">
    <div class="container-fluid">
      <?php $this->load->view('include/page-top',$page); ?>
      <!--//===============Main Container Start=============//-->
      <div class="row padding-top">
        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading blue" id="head-tile"><i class="fa fa-first-order fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content blue">
              <div class="circle-tile-description text-faded"> Today Order</div>
              
              <h3 class="tile-head"><?php today_order(); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/today_booking');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading yellow" id="head-tile"><i class="fa fa-first-order fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content yellow">
              <div class="circle-tile-description text-faded"> Total Order</div>
              
              <h3 class="tile-head"><?php all_order(); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/laundry_booking');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading green" id="head-tile"><i class="fa fa-list-alt fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content green">
              <div class="circle-tile-description text-faded">ALL Category</div>
              
              <h3 class="tile-head"><?php all_category(); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/category_management');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="<?=base_url('user/statics/'.base64_encode('directAll/1/My Referrals'));?>"><div class="circle-tile-heading lightseagreen" id="head-tile"><i class="fa fa-balance-scale fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content lightseagreen">
              <div class="circle-tile-description text-faded"> All Unit </div>
              
              <h3 class="tile-head"><?php all_unit(); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/unit_management');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading mediumseagreen" id="head-tile"><i class="fa fa-shopping-cart fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content mediumseagreen">
              <div class="circle-tile-description text-faded"> Total Approve Laundry</div>
              
              <h3 class="tile-head"><?php all_laundry(3); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/laundry_management');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>
        
        
        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading red" id="head-tile"><i class="fa fa-shopping-cart fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content red">
              <div class="circle-tile-description text-faded"> De- Active Laundry</div>
              
              <h3 class="tile-head"><?php all_laundry(0); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/laundry_management/');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading blue" id="head-tile"><i class="fa fa-shopping-cart fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content blue">
              <div class="circle-tile-description text-faded"> Active Laundry</div>
              
             <h3 class="tile-head"><?php all_laundry(1); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/laundry_management');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading lightseagreen" id="head-tile"><i class="fa fa-shopping-cart fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content lightseagreen">
              <div class="circle-tile-description text-faded"> New Laundry Request</div>
              
             <h3 class="tile-head"><?php all_laundry(2); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/new_laundry');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div>
        
       <!--  <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href="javascript:void(0);"><div class="circle-tile-heading yellow" id="head-tile"><i class="fa fa-calendar fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content yellow">
              <div class="circle-tile-description text-faded"> New Laundry</div>
              
              <h3 class="tile-head"><?php all_laundry(1); ?></h3>
              <a class="circle-tile-footer" href="<?=base_url('auth/laundry_management');?>">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div> -->

        <!-- <div class="col-lg-3 col-xs-6">
          <div class="circle-tile ">
            <a href=""><div class="circle-tile-heading lightseagreen" id="head-tile"><i class="fa fa-money fa-fw fa-3x"></i></div></a>
            <div class="circle-tile-content lightseagreen">
              <div class="circle-tile-description text-faded"> Wallet </div>
              
              <h3 class="tile-head"><?= $laundry->row()->wallet_balance ?></h3>
              <a class="circle-tile-footer" href="#">More Info <i class="fa fa-chevron-circle-right"></i></a>
            </div>
          </div>
        </div> -->

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

  function noticeModal(date,message)
  {
    $('#noticeModal').modal('show');
    $('#noticeDate').html(date);
    $('#notice').html(message);
  }
  $(document).ready(function() {
    //barChart();
    lineChart();
    // areaChart();
    // donutChart();

    $(window).resize(function() {
      //window.barChart.redraw();
      window.lineChart.redraw();
      //window.areaChart.redraw();
      //window.donutChart.redraw();
    });
  });
  function lineChart() {
    window.lineChart = Morris.Line({
      element: 'line-chart',
      data: <?php echo json_encode($data); ?>,
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Active', 'Register'],
      lineColors: ['#1e88e5','#ff3321'],
      lineWidth: '3px',
      resize: true,
      redraw: true
    });
  }
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