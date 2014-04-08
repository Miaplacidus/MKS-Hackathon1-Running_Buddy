require 'rubygems'
require 'bundler/setup'
require 'sinatra'
# require 'sinatra/reloader'
require 'thin'                ## THIS IS FOR FOREMAN
require 'mandrill'

require_relative 'spec/spec_helper'

set :bind, '0.0.0.0'

get '/' do
  erb :map
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  "You are now registered '#{params[:username]}'"
end

get '/sign_in' do
  erb :sign_in
end

get '/post_a_run' do

end

get '/map' do
  erb :map
end

# get '/send/:email' do
#   m = MyEmailer.new
#   m.send(params[:email])
#   "Email Sent"
# end

