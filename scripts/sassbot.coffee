# Description:
#   Respond to various phrases with image or text sass
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   flatboat - get a flat boat
#   dog driving a car - get a pic of such
#   scrum - scrumtrulescent!
#   zune
#
# Author:
#   drosile

module.exports = (robot) ->
  robot.hear /(^|\W)flatboat(\z|\W|$)/i, (msg) ->
    imageMe msg, "flat boat", (url) ->
      msg.send url

  robot.hear /(^|\W)dog driving a car(\z|\W|$)/i, (msg) ->
    imageMe msg, "dog driving a car", (url) ->
      msg.send url

  robot.hear /(^|\W)scrum(\z|\W|$)/i, (msg) ->
    msg.send "http://media.giphy.com/media/bdQzj73IMMtq0/giphy.gif"

  robot.hear /(^|\W)zune(\z|\W|$)/i, (msg) ->
    msg.reply "Did somebody say ZUNE?!?! Get in here, @BrianPhillips!"

imageMe = (msg, query, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"

