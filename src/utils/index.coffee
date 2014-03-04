# Common functions to be used throughout the project
#
_       = require 'lodash'
fs      = require 'fs'
path    = require 'path'

# Require all the files in a directory and add them to an
# object. By default, it will skip anything named `index`.
#
exports.requireAll = (rootPath) ->
    modules = {}
    _.chain(fs.readdirSync(rootPath))
        .map((file) -> file.slice(0, file.lastIndexOf '.'))
        .uniq()
        .filter((file) -> not /index/.test file)
        .forEach (m) ->
            modules[m] = require path.join rootPath, m
    return modules

# Simple method to create a resource from a module of routes
#
exports.makeResourceful = (server) ->
    server.resource = (resource, resourceModule) ->
        server.get  "/#{resource}", resourceModule.index
        server.get  "/#{resource}/new", resourceModule.new
        server.post "/#{resource}", resourceModule.create
        server.get  "/#{resource}/:id", resourceModule.show
        server.del  "/#{resource}/:id", resourceModule.destroy
