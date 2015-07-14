// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery-ui
//= require jquery_ujs
//= require jquery.turbolinks
//= require moment
//= require jquery-ui-timepicker-addon
//= require fullcalendar
//= require bootsy
//= require_tree .
$(function() {
  $("#post_fromdate").datepicker({dateFormat: 'yy-mm-dd'});
	$("#post_todate").datepicker({dateFormat: 'yy-mm-dd'});
	$("#post_date").datepicker({dateFormat: 'yy-mm-dd'});
	$("#post_time").timepicker();	
});
$(document).ready(function(){
$(".dtype").change(function(){
if($("#multi").attr("checked")){
  $(".dates").css("display","block");
  $(".date").css("display","none");
}
else if($("#single").attr("checked")){
  $(".date").css("display","block");
  $(".dates").css("display","none");
}
});
});
