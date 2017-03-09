# Description:
#   Displays a random pizza gif from animatedpizzagifs.com
#
# Configuration:
#   HUBOT_TUMBLR_API_KEY - A Tumblr OAuth Consumer Key will work fine
#   HUBOT_MORE_PIZZA - Show pizza whenever anyone mentions it (default: false)
#
# Commands:
#   hubot pizza - Show a pizza gif
#
# Author:
#   Ian Young <ian@iangreenleaf.com>

tumblr = require 'tumblrbot'
PIZZA = "pizzagifs.tumblr.com"

module.exports = (robot) ->
  func = if process.env.HUBOT_MORE_PIZZA then 'hear' else 'respond'
  robot[func](/pizza/i, (msg) ->
    tumblr.photos(PIZZA).random (post) ->
      msg.send post.photos[0].original_size.url
  )
