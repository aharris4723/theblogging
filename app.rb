require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:main.sqlite3'
set :sessions, true
require './models'

get '/' do 
	@blogs = Blog.all
	erb :login	
end


get '/profile.erb' do 
	@blogs = Blog.all
erb :profile	
end
post "/create_blog" do 
user = User.find(session[:user_id])	
Blog.create(title: params[:title], content: params[:content], user_id: user.id)
redirect '/'
end