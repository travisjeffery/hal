module.exports = (robot) ->
  robot.respond /(urban)( me)? (.*)/i, (msg) ->
    urbanDict msg, msg.match[3], (word, definition) ->
      msg.send "#{word}: #{definition}"

urbanDict = (msg, query, callback) ->
  msg.http("http://stormy-sword-6278.herokuapp.com/api/#{escape(query)}")
    .get() (err, res, body) ->
      entry = JSON.parse(body).entries[0]
      callback(entry.word, entry.definition)

