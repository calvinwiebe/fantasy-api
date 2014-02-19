# Entry point of Fantasy Server
#
restify     = require 'restify'
server      = restify.createServer()

server.get 'hello', (req, res, next) ->
    res.send 'hello world! YEAYAYAYAY!'

console.log 'REST API server started up.'
server.listen 3000