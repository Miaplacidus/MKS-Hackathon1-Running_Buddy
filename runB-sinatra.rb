require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'thin'                ## THIS IS FOR FOREMAN
require 'mandrill'

enable :sessions
require_relative 'spec/spec_helper'

set :bind, '0.0.0.0'

get '/' do
  if session[:flash]
    @flash = session[:flash]
    session.delete(:flash)
  end
  erb :map
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  session[:flash] = "You are now registered as '#{params[:username]}'"
  redirect '/'
end

get '/sign_in' do
  puts params
  puts session[:username]
  erb :sign_in

  result = RunB::SignIn.run(:username => params[:username], :password => params[:password])
  if result.success?
    puts "Success: #{result.inspect}"
    session[:username] = params[:username]
    redirect "/"
  else
    if result.error == :invalid_username
      @message = "Sorry, username invalid"
    end
    if result.error == :invalid_password
      @message = "Sorry, password is not correct."
    end
    puts @message
    erb :sign_in
end

post '/sign_in' do
  session[:flash] = "You are now signed in '#{params[:username]}'"
  redirect '/'
end

get '/post_a_run' do

end

get '/map' do
  erb :map
end

not_found do
  status 404
  'not found'
end

# get '/send/:email' do
#   m = MyEmailer.new
#   m.send(params[:email])
#   "Email Sent"
# end

