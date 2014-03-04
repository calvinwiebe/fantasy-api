# Entry point of Fantasy Server
#
restify     = require 'restify'
server      = restify.createServer()
_           = require 'lodash'

PORT = 3000

# setup all the routes for all of our resources.
# By convention, each resource should have all _CRUD_
# operations
resources = require './resources'

server.listen PORT, ->
    console.log "REST API server started up. Listening on port #{PORT}"
