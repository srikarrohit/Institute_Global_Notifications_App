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
	var url = "/json";
  var http = new XMLHttpRequest();
  http.open("GET", url, true);
  http.setRequestHeader("Content-type", "application/json");
	var gdata,sdata;
    http.onreadystatechange = function() {
        if(http.readyState == 4 && http.status == 200) {
            var data = JSON.parse(http.responseText);
						stddata = data.students;
						for (var i=0;i<stddata.length;i++)
						{
							if( stddata[i].id == x )
							{
								var initial = stddata[i].notifids;
								var split = initial.split(',');
								var copy = split;
								for ( var j=0;j<split.length;j++)
								{
									if( split[j] == y)
									{
										copy.splice(j,1)
									}
								}
								split = copy;
								split.join(',');
								var finaldata = split;
								stddata[i].notifids = finaldata;
								data.students[i]=stddata[i];
							}
						}
						gdata=data;
						sdata=JSON.stringify(gdata);
        }
    }
		console.log(sdata);
		http.send(sdata);
	}
/*$(".side-a").click(function(){
	$(".side-a").removeClass("active");
	$(this).addClass("active");
});
$(".side-b").click(function(){
	$(".side-b").removeClass("active");
	$(this).addClass("active");
});
*/
//$(".active").click(function(){
//	$(this).removeClass("active");
//});
