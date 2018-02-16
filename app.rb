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
	@users = User.all
	erb :users
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

post '/update_account' do
	User.update(username: params[:username], password: params[:password])
	redirect '/'
end

post '/delete_account' do
	user = User.find(session[:user_id])
	user.destroy
	redirect '/'
end

get '/profile' do
if session[:user_id]
@user = User.find(session[:user_id])
@blogs = @user.blogs
erb :profile
else
	redirect '/'
end
end

post "/create_blog" do
user = User.find(session[:user_id])
Blog.create(title: params[:title], content: params[:content], user_id: user.id)
redirect '/profile'
end


get "/settings" do
	if session[:user_id]
	erb :"users/settings"
else
	redirect '/'
end
end

post "/logout_account" do
	session[:user_id] = nil
	redirect '/'
end

get '/users/:id' do
	user = User.find(params[:id])
	@blogs = user.blogs
	erb :"users/show"

end
