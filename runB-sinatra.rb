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
  if sessions[:flash]
    @flash = session[:flash]
    session.delete(:flash)
  end
  erb :map
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  sessions[:flash] = "You are now registered as '#{params[:username]}'"
  redirect '/'
end

get '/sign_in' do
  erb :sign_in
end

post '/sign_in' do
  sessions[:flash] = "You are now signed in '#{params[:username]}'"
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

