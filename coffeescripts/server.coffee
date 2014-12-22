express = require "express"
pg = require "pg"
app = express()
Datastore = require "nedb"
db = new Datastore(filename: "#{__dirname}/count.db",autoload: true);
app.set 'views', "#{__dirname}/views"
app.get "/", (req,res)->
	db.find {}, (err,docs) ->
		res.render "index.html.jade",{count: docs.length }
app.get "/download", (req,res) ->
	new_doc = {ip: req.ip, time: new Date()}
	db.insert new_doc, (err,doc) ->
		console.error(err) if err
	res.set 'Content-type', 'application/chrome-extension'
	res.attachment "#{__dirname}/oneclick-fontchanger.crx"
	res.sendFile "#{__dirname}/oneclick-fontchanger.crx"

app.listen 4000, ->
	console.log "Starting Server on port 4000"
