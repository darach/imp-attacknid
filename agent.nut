server.log("spiders, yo.")
 
function requestHandler(request, response) {
  try {
    if ("mask" in request.query) {
        local pinState = request.query.mask.tointeger();
        device.send("mask", pinState); 
    }
    response.send(200, "OK");
  } catch (ex) {
    response.send(500, "Internal Server Error: " + ex);
  }
}

device.onconnect(function() {
    server.log("Device connected to agent");
    device.send("clear", 0);
});

device.ondisconnect(function() {
    server.log("Device disconnected from agent");
}); 

http.onrequest(requestHandler);
