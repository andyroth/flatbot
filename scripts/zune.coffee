# Description:
#   Did somebody say Zune?
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   zune
#
# Author:
# drosile@gmail.com
module.exports = (robot) ->

  robot.respond /fortune|cookie me/i, (msg) ->
  robot.hear "zune", (msg) ->
    msg.reply "Did somebody say ZUNE?!?! Get in here, @BrianPhillips!"
