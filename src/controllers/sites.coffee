Site = require '../models/site'

# Site model's CRUD controller.
module.exports =
  # Lists all Sites
  index: (req, res) ->
    Site.find {}, (err, sites) ->
      res.send sites

  # Creates new Site with data from `req.body`
  create: (req, res) ->
    site = new Site
      url: req.body.url
    site.save (err, site) ->
      if not err
        console.log site, 'saved successfully!'
        res.statusCode = 201
        res.redirect '/'
      else
        res.send "Error:\n#{err}\nEnd error."
        res.statusCode = 500

  # Gets Site by id
  get: (req, res) ->
    Site.findById req.params.id, (err, site) ->
      if not err
        res.send site
      else
        res.send err
        res.statusCode = 500

  # Updates Site with data from `req.body`
  update: (req, res) ->
    Site.findByIdAndUpdate req.params.id, {"$set":req.body}, (err, site) ->
      if not err
        res.send site
      else
        res.send err
        res.statusCode = 500

  # Deletes Site by id
  delete: (req, res) ->
    Site.findByIdAndRemove req.params.id, (err) ->
      if not err
        res.send {}
      else
        res.send err
        res.statusCode = 500
