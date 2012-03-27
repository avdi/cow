class CowMessage
  include DataMapper::Resource

  property :id,      Serial
  property :message, String, default: "Hello, world!"
  property :cowfile, String, default: "default"

  def to_s
    Cowsay.new_cow(cowfile: cowfile).say(message)
  end
end
