# Entry point of Fantasy Server
#
restify     = require 'restify'
server      = restify.createServer()

PORT = 3000

# define some simple routes
server.get '/', (req, res, next) ->
    dummyRoutes =
        standings:
            method: 'GET'
            url: '/standings/:pool'
        picks:
            1:
                method: 'GET'
                url: '/picks/:pool'
            2:
                method: 'GET'
                url: '/picks/series/:pool'

    res.send dummyRoutes

server.get '/standings/:pool', (req, res, next) ->
    standings =
        pool: req.params.pool
        standings: [
                player: 'icebox'
                points: -90
            ,
                player: 'calvin'
                points: 123
        ]

    res.send standings

server.get '/picks/:pool', (req, res, next) ->
    picks =
        pool: req.params.pool
        picks: [
                name: 'ROUND 1'
                deadline: new Date()
                series: [
                    '823urkjasdfa39'
                    'kdshf8sjkfsdhf'
                    'flskdahf83usdj'
                ]
        ]

    res.send picks

server.get '/picks/series/:pool', (req, res, next) ->
    picks =
        pool: req.params.pool
        series: [
                desc: 'BOS vs TOR'
                id: '823urkjasdfa39'
                topPlayers:
                    1:
                        team: 'BOS'
                        name: 'Patrice Bergeron'
                    2:
                        team: 'TOR'
                        name: 'Phil Kessel'
            ,
                desc: 'NYR vs PITT'
                id: 'kdshf8sjkfsdhf'
                topPlayers:
                    1:
                        team: 'NYR'
                        name: 'Rick Nash'
                    2:
                        team: 'Pitt'
                        name: 'Sidney Crosby'
        ]

    res.send picks

server.listen PORT, ->
    console.log "REST API server started up. Listening on port #{PORT}"
