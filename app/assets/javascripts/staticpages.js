	$('#calendar').fullCalendar({
	/*	events:function (start, end, callback) {
    $.ajax({
        type: "get",
        url: 'http://localhost/php2.php?start=&end=',
        data: {},
        dataType: 'jsonp',
        contentType: 'application/json',
        success: function (data)
				 {
           callback(events);
        }
    });
	}*/
//	var url = 'http://localhost/php2.php?callback=?';
events:function(start,end,timezone,callback)
{ 
	$.ajax({
  	 type: 'GET',
    	url: 'http://localhost/php2.php?callback=?',
    	async: false,
    	jsonpCallback: 'jsonCallback',
    	contentType: "application/json",
    	dataType: 'jsonp',
    	success: function(json) {
       	console.log(json.events);
				callback(json.events);
//				console.log(callback(json.events));
    	},
    	error: function(e) {
       	console.log(e.message);
    	}
});
}
});
/*(function($) {
var url = 'http://localhost/php2.php?callback=?';
 
$.ajax({
   type: 'GET',
    url: url,
    async: false,
    jsonpCallback: 'jsonCallback',
    contentType: "application/json",
    dataType: 'jsonp',
    success: function(json) {
       console.dir(json.events);
    },
    error: function(e) {
       console.log(e.message);
    }
});
 
})(jQuery);*/
