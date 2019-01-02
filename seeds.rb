# Run this script with `bundle exec ruby seeds.rb`
require 'sqlite3'
require 'active_record'

#require model classes
# require './models/cake.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
if ENV['DATABASE_URL']
ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'])
else
  adapter: 'sqlite3',
  database: 'db/development.db'
)

# do stuff to store initial data