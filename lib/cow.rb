require 'sinatra'
require_relative 'cowsay'

get '/' do
  content_type :txt
  message = params.fetch('message') { 'Hello' }
  Cowsay.new_cow.say(message)
end
