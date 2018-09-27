var webSocket = null;

$(document).ready(function() {
  webSocket = $.simpleWebSocket({
    url: WS_URL +'ws/chat?user_id=' + USER_ID
  });
	webSocket.listen(function(message) {
	  console.log(message);
    var content = "<li>" + message['sender_id'] + "<br>" + message['moment'] + "<br>" + message['message'] + "</li>";
    $("#ulMessages").append(content);
    //converationUl.appendChild(li);
  });
});

$("#btnSend").click(function(event){
	var message = $("#txtMessage").val();
	var user_id = $("#txtUser").val();
  var guest_id = $("#txtGuest").val();
	webSocket.send({
    'action': 'chatMessage',
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
