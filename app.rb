require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:main.sqlite3'
set :sessions, true
require './models'


get '/' do

	erb :login
end

post '/signin' do
	@username = params[:username]
	@password = params[:password]
	if
		user = User.where(username: @username, password: @password).first
		session[:user_id] = user.id
		redirect '/feed'
	else
		redirect '/'
	end
end

get '/users' do
	erb :users
end



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
