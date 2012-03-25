require 'sinatra'
require_relative 'cowsay'

get '/' do
  content_type :txt
  message = params.fetch('message') { 'Hello' }
  cowfile = params.fetch('cowfile') { 'default'   }
  cow = Cowsay.new_cow(:cowfile => cowfile)
  cow.say(message)
end
