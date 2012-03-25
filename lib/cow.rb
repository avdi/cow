require 'sinatra'
require_relative 'cowsay'

get '/' do
  content_type :txt
  Cowsay.new_cow.say("Hello")
end
