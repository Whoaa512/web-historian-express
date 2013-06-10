mongoose = require 'mongoose'

# Site model
Site = new mongoose.Schema(
  title: String
  body: String
  url: String
  created_at: Date
)

module.exports = mongoose.model 'Site', Site
