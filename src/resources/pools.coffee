# Pools resource

# unimplemented
exports.new = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

exports.show = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

exports.destroy = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

exports.create = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

# Return the pools a user belongs to
#
exports.index = (req, res, next) ->
    user = req.params.user

    # TODO: go to DB and get pools
    # req.rethink.get
    pools = [
            name: 'Khello 2014 NHL playoffs'
            id: 1234567
        ,
            name: 'Khello 2013 NHL playoffs'
            id: 1234568
    ]

    res.send pools