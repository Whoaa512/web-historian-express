mongoose = require 'mongoose'

# ArchivedSite model
ArchivedSite = new mongoose.Scheme(
  title: String
  body: String
  url: String
  created_at: Date
)

module.exports = mongoose.model 'ArchivedSite', ArchivedSite
