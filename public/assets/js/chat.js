var webSocket = null;

$(document).ready(function() {
  webSocket = $.simpleWebSocket({
    url: WS_URL +'ws/chat?user_id=' + USER_ID
  });
	webSocket.listen(function(message) {
	   console.log(message);
  });
});

$("#btnSend").click(function(event){
	var message = $("#txtMessage").val();
	var user_id = $("#txtUser").val();
  var guest_id = $("#txtGuest").val();
	webSocket.send({
    'action': 'sendMessage',
    'message': message,
    'user_id':user_id,
    'guest_id': guest_id ,
  }).done(function(message) {
		console.log(message);
	}).fail(function(message) {
	  // error sending
	  console.log(message);
	});
});
