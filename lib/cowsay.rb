require 'pathname'

module Cowsay
  class Cow
    def say(message)
      cowsay_path = Pathname(__FILE__).dirname + "../bin/cowsay"
      perl_path   = "/usr/bin/perl"
      cows_path   = Pathname(__FILE__).dirname + "cowsay/cows"
      env         = {
        'COWPATH' => cows_path.to_s
      }
      IO.popen([env, perl_path, cowsay_path.to_s, message]) do
        |process|
        process.read
      end
    end
  end
end
