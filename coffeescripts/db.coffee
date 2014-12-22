class DB
	constructor: (@db_url)->
		@getCount (result)=>
			console.log(result)
		, (err)=>
			@setCount()		
	setCount: ->
		pg.connect @db_url, (err,client,done) ->
			client.query "CREATE TABLE count (id int PRIMARY KEY,hits int);", (err,result) ->
				console.error(err) if err
			client.query "INSERT INTO count VALUES (1,0)", (err,result) ->
				done()
				console.error(err) if err	

	getCount: (success,error)->
		pg.connect @db_url, (err,client,done) ->
						done()
						console.error(err) if err
						client.query "SELECT * FROM count WHERE id=1;", (err,result) ->
							console.log(result)
							if err
								console.error(err)
								error()
							else
								success(result)
	updateCount: (new_count)->
		pg.connect @db_url, (err,client,done) ->
			console.error(err) if err
			client.query("UPDATE count SET VALUES(#{new_count} WHERE id=1;")
			done()
