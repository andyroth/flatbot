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

  robot.hear /(^|\W)zune(\z|\W|$)/i, (msg) ->
    msg.reply "Did somebody say ZUNE?!?! Get in here, @BrianPhillips!"
