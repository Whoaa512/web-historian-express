ArchivedSite = require '../models/ArchivedSite'

# ArchivedSite model's CRUD controller.
module.exports =
  # Lists all archivedSites
  index: (req, res) ->
    ArchivedSite.find {}, (err, sites) ->
      res.send sites

  # Creates new archivedSite with data from `req.body`
  create: (req, res) ->
    site = new ArchivedSite req.body
    site.save (err, site) ->
      if not err
        res.send site
        res.statusCode = 201
      else
        res.send err
        res.statusCode = 500

  # Gets archivedSite by id
  get: (req, res) ->
    ArchivedSite.findById req.params.id, (err, site) ->
      if not err
        res.send site
      else
        res.send err
        res.statusCode = 500


  # Updates archivedSite with data from `req.body`
  update: (req, res) ->

  # Deletes archivedSite by id
  delete: (req, res) ->
