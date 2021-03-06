// Generated by CoffeeScript 1.6.3
(function() {
  var Datastore, app, db, express, pg;

  express = require("express");

  app = express();

  Datastore = require("nedb");

  db = new Datastore({
    filename: "" + __dirname + "/count.db",
    autoload: true
  });

  app.set('views', "" + __dirname + "/views");

  app.get("/", function(req, res) {
    return db.find({}, function(err, docs) {
      return res.render("index.html.jade", {
        count: docs.length
      });
    });
  });

  app.get("/download", function(req, res) {
    var new_doc;
    new_doc = {
      ip: req.ip,
      time: new Date()
    };
    db.insert(new_doc, function(err, doc) {
      if (err) {
        return console.error(err);
      }
    });
    res.set('Content-type', 'application/chrome-extension');
    res.attachment("" + __dirname + "/oneclick-fontchanger.crx");
    return res.sendFile("" + __dirname + "/oneclick-fontchanger.crx");
  });

  app.listen(4000, function() {
    return console.log("Starting Server on port 4000");
  });

}).call(this);
