var http = require("http");

//create a server object:
http
  .createServer(function (req, res) {
    res.write("<h1>Node.js - Hello World !</h1>"); //write a response to the client
    res.end(); //end the response
  })
  .listen(9001); //the server object listens on port 9001
