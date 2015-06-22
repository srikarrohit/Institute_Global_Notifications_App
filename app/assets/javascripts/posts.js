$(document).ready(function(){
$(".dtype").change(function(){
if($("#multi").is(":checked")){
  $(".dates").css("display","block");
  $(".date").css("display","none");
}
else if($("#single").is(":checked")){
  $(".date").css("display","block");
  $(".dates").css("display","none");
}
});
});
