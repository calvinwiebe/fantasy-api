# Entry point of Fantasy Server
#
restify             = require 'restify'
server              = restify.createServer()
_                   = require 'lodash'
{makeResourceful}   = require './utils'

PORT = 3000
makeResourceful server

# setup plugins
server.use restify.acceptParser(server.acceptable)
server.use restify.authorizationParser()
server.use restify.dateParser()
server.use restify.queryParser()
server.use restify.jsonp()
server.use restify.gzipResponse()
server.use restify.bodyParser()

# setup all the routes for all of our resources.
# By convention, each resource should have all _CRUD_
# operations
resources = require './resources'
_.forOwn resources, (v, k) -> server.resource k, v

server.listen PORT, ->
    console.log "REST API server started up. Listening on port #{PORT}"
