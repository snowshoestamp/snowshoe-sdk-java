<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body id="stampable">
		
		
		<canvas id="myCanvas">
				<script>
					var canvas = document.getElementById("myCanvas");
					var ctx = canvas.getContext("2d");
					canvas.width = window.innerWidth;
					canvas.height = window.innerHeight;
					ctx.font = "30px Arial";
					ctx.textAlign = "center"
					ctx.fillText("Stamp Me!", canvas.width/2, canvas.height/2);
				</script>
		</canvas>
		
		
		<script>
			var stampScreenInitData = {
				  	"postUrl": "/snowshoe-sdk-java/servlet/receiver",
				  	"stampScreenElmId": "myCanvas",
		    		"messages": {
						"userTraining" : "<h3>Keep holding</h3>",
						"insufficientPoints" : "<h3>Try again!</h3>"
					},
					"postViaAjax": true, // post via Ajax  
					"success": function(response){
						// handle success
						response = JSON.parse(response);
						console.log("Success!");
						console.log(response);
						console.log(response.stamp);
						console.log(response.stamp.serial);
						console.log(response.receipt);
						
						var canvas = document.getElementById("myCanvas");
						var ctx = canvas.getContext("2d");
						canvas.width = window.innerWidth;
						canvas.height = window.innerHeight;
						ctx.font = "30px Arial";
						ctx.textAlign = "center"
						ctx.fillText("Serial: " + response.stamp.serial + "\n\r Receipt: " + response.receipt, canvas.width/2, canvas.height/2);

						$("#snowshoe-messages").empty();
					},
					"error": function(response){
						// handle failure
						console.log(" :-( ");
						$("#snowshoe-messages").empty();
						// show failure message
						$("#snowshoe-messages").append("<h3>That stamp was not found. Please try again!</h3>");
					}
				}
		</script>
		<script src="https://cdn.snowshoestamp.com/snowshoe-jquery/3.0.1/jquery.snowshoe.js"></script>
		
	</body>
</html>