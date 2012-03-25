module Cowsay
  class Cow
    def say(message)
      IO.popen(['cowsay', message]) do |process|
        process.read
      end
    end
  end
end
