var webSocket = null;

$(document).ready(function() {
  webSocket = $.simpleWebSocket({
    url: WS_URL +'ws/chat?user_id=' + USER_ID
  });
  console.log("1 ++++++++++++++++++++++++++++++++++++");
	webSocket.listen(function(message) {
	   console.log(message);
  });
});
