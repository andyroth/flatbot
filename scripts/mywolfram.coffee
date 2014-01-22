# Description:
#   Interface with wolframalpha
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_WOLFRAM_APPID - your wolfram alpha app ID
#
# Commands:
#   hubot wolfram [query] - query wolfram alpha with [query]
#
# Author:
#   drosile

QS = require 'querystring'

module.exports = (robot) ->
  robot.respond /wolfram(?: me)? (.*)/i, (msg) ->
    input = msg.match[1]
    appid = process.env.HUBOT_WOLFRAM_APPID
    query = input: input, appid: appid, includepodid: 'result'
    msg.http("http://api.wolframalpha.com/v2/query")
      .query(query)
      .get() (err, res, xml) ->
        switch res.statusCode
          when 200
            try
              [_, response] = xml.match "<plaintext>(.+?)</plaintext>"
            catch error
              response = "ERROR - Does not compute."
            msg.reply response
          else
            msg.reply "Dunno."
