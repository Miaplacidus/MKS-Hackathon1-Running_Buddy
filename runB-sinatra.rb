require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'thin'                ## THIS IS FOR FOREMAN
require 'mandrill'

require_relative 'spec_helper'

set :bind, '0.0.0.0'

get '/' do
  'Welcome to Running Buddy!'
end

get '/send/:email' do
  m = MyEmailer.new
  m.send(params[:email])
  "Email Sent"
end

