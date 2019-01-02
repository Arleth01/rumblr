require 'sinatra'
require "sinatra/reloader"

# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require model classes
# require './models/cake.rb'
require './models/user.rb'
require './models/post.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

register Sinatra::Reloader
enable :sessions

get '/' do
  erb :index
end

get '/all' do
  erb :all
end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

get '/logout' do 
  erb :logout
end 

post '/users/login' do
  user = User.find_by(email: params["email"], password:
  params["password"])
  if user 
    session[:user_id] = user.id 
    redirect '/all'
  else 
    redirect '/'
  end 
end 
  
# app.get('/logout', function(req, res){
#   req.logout();
#   res.redirect('/');
#   }); 
post '/users/signup' do
  User.create(email: params[:email], firstname: params[:firstname], lastname: params[:lastname], password:
  params[:password], )
end 

binding.pry