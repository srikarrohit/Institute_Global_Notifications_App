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
eventLimit: true, // for all non-agenda views
    views: {
        agenda: {
            eventLimit: 3 // adjust to 6 only for agendaWeek/agendaDay
        }
    },
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
},
});
function destroy(x,y){    
	var url = "/public/users.json";
  var http = new XMLHttpRequest();
  http.open("POST", url, true);
  http.setRequestHeader("Content-type", "application/json");
    http.onreadystatechange = function() {
        if(http.readyState == 4 && http.status == 200) {
            var data = JSON.parse(http.responseText);
						for (var obj in data)
						{
							if( obj.id == x )
							{
								var initial = obj.notifids;
								var split = initial.split(',');
								var copy = split;
								for ( var s in split )
								{
									if( s == y)
									{
										copy.splice(indexOf(y),1)
									}
								}
								split = copy;
								split.join(',');
								var finaldata = split;
								obj.notifids = finaldata;
							}
						}
        }
    }
    http.send(data);
	}
