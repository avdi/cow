require 'rack/test'
require 'sinatra'
require 'cow'

set :environment, :test

describe "The Cow app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "generates a cow" do
      expected = (<<'END').strip
 _______
< Hello >
 -------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
END
    get '/'
    result = last_response.body.strip
    result.should eq(expected)
  end
end
