	$('#calendar').fullCalendar({
		events:function (start, end, callback) {
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
	}
});
