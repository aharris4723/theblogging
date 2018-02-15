require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:main.sqlite3'
set :sessions, true
require './models'



get '/' do
	erb :login
end

get '/signup' do 
	erb :"users/signup"
end

post '/create_account' do
	User.create(username: params[:username], password: params[:password])
	redirect '/'
end

get '/feed' do
	@blogs = Blog.all
	erb :feed
end

get '/' do 
	@blogs = Blog.all
	erb :login	
end

post '/update_account' do
	User.update(username: params[:username], password: params[:password])
	redirect '/'
end

post 'delete_account' do
	"heelo"
	redirect '/'
end