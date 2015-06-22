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
