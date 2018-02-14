require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:main.sqlite3'
set :sessions, true
require './models'

get '/' do 
	@blogs = Blog.all
	erb :login	
end
