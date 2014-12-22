express = require "express"
app = express()
app.set 'views', "#{__dirname}/views"
app.get "/", (req,res)->
	res.render "index.html.jade"
app.get "/download", (req,res) ->
	res.set 'Content-type', 'application/chrome-extension'
	res.attachment "#{__dirname}/oneclick-fontchanger.crx"
	res.sendFile "#{__dirname}/oneclick-fontchanger.crx"

app.listen 4000, ->
	console.log "Starting Server on port 4000"