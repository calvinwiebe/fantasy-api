# grab all the resources in this dir and
# expose them
#
{requireAll} = require '../utils'

modules = requireAll __dirname
console.log modules
module.exports = modules