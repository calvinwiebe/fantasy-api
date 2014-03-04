# Login resource. This is not a traditional resource, but
# we will use the same semantics. We will only implement
# the post method.

# unimplemented
exports.index = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

exports.new = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

exports.show = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

exports.destroy = (req, res, next) ->
    res.status(404)
    res.send msg: 'not found'

# Take in a username and password and verify they exist in the db.
# If yes, log in the user and give them back a session.
# TODO: the session part
#
exports.create = (req, res, next) ->
    email = req.params.email
    password = req.params.password

    # TODO: go to DB and check
    authenticated = true

    res.json
        authenticated: yes
        user: 1234567