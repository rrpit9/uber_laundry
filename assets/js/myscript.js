//////Sidebar height//////////////////
$(document).ready(function() {
    function setHeight() {
        windowHeight = $(window).innerHeight();
        $('.sidebar').css('min-height', windowHeight);
    };
    setHeight();
    
    $(window).resize(function() {
        setHeight();
    });
});

// disable  Browser Back Button
// history.pushState({ page: 1 }, "Title 1", "#no-back");
// window.onhashchange = function (event) {
//   window.location.hash = "no-back";
// };
$('body').append('<div id="backToTop" class="btn btn-lg"><span class="glyphicon glyphicon-chevron-up"></span></div>');
$(window).scroll(function () {
    if ($(this).scrollTop() <= 200) {
        $('#backToTop').fadeOut();
		} else {
        $('#backToTop').fadeIn();
    }
}); 
$('#backToTop').click(function(){
    $("html, body").animate({ scrollTop: 0 }, 600);
    return false;
});

var specialKeys = new Array();
specialKeys.push(8); //Backspace
function IsDoublefun(e) {
    var keyCode = e.which ? e.which : e.keyCode
    var ret = ((event.keyCode >= 48 && event.keyCode <= 57) || 
        
        event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 ||
    event.keyCode == 39 || event.keyCode == 46 || event.keyCode == 190|| specialKeys.indexOf(keyCode) != -1);
    
    return ret;
}


$(document).ready(function() {
    $('#table1').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'pageLength',
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],
        lengthMenu: [
            [ 10, 25, 50, 100, -1 ],
            [ '10 rows', '25 rows', '50 rows', '100 rows', 'Show all' ]
        ]
    });
    
    
    $('#table2').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'pageLength',
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],
        lengthMenu: [
            [ 10, 25, 50, 100, -1 ],
            [ '10 rows', '25 rows', '50 rows', '100 rows', 'Show all' ]
        ]
    });
    
});

$('#datepairExample .date').datepicker({
    'format': 'yyyy-mm-dd',
    'autoclose': true
});