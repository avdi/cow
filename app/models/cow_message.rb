class CowMessage
  include ActiveModel::Naming
  include ActiveModel::Conversion

  def self.model_name
    ActiveModel::Name.new(self)
  end

  attr_accessor :message, :cowfile

  def initialize
    self.message = "Hello, World!"
    self.cowfile = "default"
  end

  def persisted?
    false
  end

  def to_s
    Cowsay.new_cow(cowfile: cowfile).say(message)
  end
end
