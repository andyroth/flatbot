# Description:
#   Respond to flatboat with image search for flatboat
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   flatboat - get a flat boat
#
# Author:
#   drosile

module.exports = (robot) ->
  robot.hear "flatboat", (msg) ->
    q = v: '1.0', rsz: '8', q: 'flat boat', safe: 'active'
    msg.http('http://ajax.googleapis.com/ajax/services/search/images')
        .query(q)
        .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.responseData?.results
        if images?.length > 0
            image  = msg.random images
            msg.reply "#{image.unescapedUrl}#.png"
