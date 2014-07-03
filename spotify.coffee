##############################
#   Control Spotify on OSX   #
##############################

sh = require('sh')
spotify = require('spotify')

module.exports = (robot) ->
  # show commands
  
  options = {}
  options.commands = [
    "current song - Shows what song I'm currently playing"
  ]
  
  # starting volume in spotify
  options.volume = 100
  
  robot.respond /spotify$/i, (msg) ->
    msg.send options.commands.join("\n")
  
  # controls
  # show what song I'm currently playing
  robot.respond /(current|song|track|current song|current track)$/i, (msg) ->
    song = sh('osascript src/scripts/current_song.scpt')
    song.result (obj) ->
      msg.send "The current song I'm playing is "+ obj