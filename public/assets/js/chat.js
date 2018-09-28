var webSocket = null;

$(document).ready(function() {
  webSocket = $.simpleWebSocket({
    url: WS_URL +'ws/chat?user_id=' + USER_ID
  });
	webSocket.listen(function(message) {
    console.log(message);
    try {
      var arrayPath = window.location.pathname.split('/');
      arrayPath.shift();
      switch(arrayPath[0]) {
        case '':
          notifyMessage(message);
          break;
        case 'chat':
          addMessage(message);
          break;
        default:
          console.log("DEFAULT???");
      }
    }
    catch(err) {
      console.log(err);
    }
  });
});

function notifyMessage(message){
  alert('ha recibido un mensaje del user_id ' + message['sender_id'] );
}

function addMessage(message){
  var content = "<li>" + message['sender_id'] + "<br>" + message['moment'] + "<br>" + message['message'] + "</li>";
  $("#ulMessages").append(content);
}

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
