require 'pathname'

module Cowsay
  def self.new_cow(*args)
    Cow.new(*args)
  end

  class Cow
    def initialize(options = {})
      @io      = options.fetch(:io)      { IO    }
      @cowfile = options.fetch(:cowfile) { 'default' }
    end

    def say(message)
      cowsay_path = Pathname(__FILE__).dirname + "../bin/cowsay"
      perl_path   = "/usr/bin/perl"
      cows_path   = Pathname(__FILE__).dirname + "cowsay/cows"
      env         = {
        'COWPATH' => cows_path.to_s
      }
      args        = %W[-f #{@cowfile}]
      @io.popen([env, perl_path, cowsay_path.to_s, *args], 'r+') do
        |process|
        process.write(message)
        process.close_write
        process.read
      end
    end
  end
end
