# Description:
#   Respond to scrum with scrumtrulescent gif
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   scrum - scrumtrulescent!
#
# Author:
#   drosile

module.exports = (robot) ->
  robot.hear /(^|\W)scrum(\z|\W|$)/i, (msg) ->
    msg.send "http://media.giphy.com/media/bdQzj73IMMtq0/giphy.gif"
