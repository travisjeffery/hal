module.exports = (robot) ->
  robot.respond /(urban)( define)?( example)?( me)? (.*)/i, (msg) ->
    urbanDict msg, msg.match[4], (entry) ->
      if msg.match[2]
        msg.send "#{entry.example}"
      else
        msg.send "#{entry.definition}"

urbanDict = (msg, query, callback) ->
  msg.http("http://stormy-sword-6278.herokuapp.com/api/#{escape(query)}")
    .get() (err, res, body) ->
      callback(JSON.parse(body).entries[0])

