require 'rspec'
require 'English'

root = (Pathname(__FILE__).dirname + "..").expand_path

$LOAD_PATH.unshift((root + "app/models").to_s)
