require 'rack/test'
require 'sinatra'
require 'json'
require 'cow'

set :environment, :test

describe "The Cow app" do
  include Rack::Test::Methods

  def app
    Cow
  end

  def normalize_text(text)
    text.strip!
    text.gsub!(/\s+$/,'')
    text
  end

  let(:response_body) {
    normalize_text(last_response.body)
  }

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
    response_body.should eq(expected)
  end

  it 'uses the message parameter if supplied' do
    expected = (<<'END').strip
 ___________
< Good bye! >
 -----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
END
    get '/', 'message' => "Good bye!"
    response_body.should eq(expected)
  end

  it 'accepts a cowfile parameter' do
    expected = (<<'END').strip
 _______
< Hello >
 -------
\                             .       .
 \                           / `.   .' "
  \                  .---.  <    > <    >  .---.
   \                 |    \  \ - ~ ~ - /  /    |
         _____          ..-~             ~-..-~
        |     |   \~~~\.'                    `./~~~/
       ---------   \__/                        \__/
      .'  O    \     /               /       \  "
     (_____,    `._.'               |         }  \/~~~/
      `----.          /       }     |        /    \__/
            `-.      |       /      |       /      `. ,~~|
                ~-.__|      /_ - ~ ^|      /- _      `..-'
                     |     /        |     /     ~-.     `-. _  _  _
                     |_____|        |_____|         ~ - . _ _ _ _ _>
END
    get '/', 'cowfile' => "stegosaurus"
    response_body.should eq(expected)
  end

  describe '/cowfiles' do
    def do_request
      get '/cowfiles'
    end

    it 'returns cowfiles with a JSON content type' do
      do_request
      last_response.content_type.should match(/application\/json/)
    end

    it 'returns a list of available cowfiles' do
      do_request
      result = JSON.parse(response_body)
      result.should eq(%w[
        apt beavis.zen bong bud-frogs bunny calvin cheese cock cower
        daemon default dragon dragon-and-cow duck elephant
        elephant-in-snake eyes flaming-sheep ghostbusters gnu head-in
        hellokitty kiss kitty koala kosh luke-koala mech-and-cow meow
        milk moofasa moose pony pony-smaller ren sheep
        skeleton snowman stegosaurus stimpy suse
        three-eyes turkey turtle tux unipony unipony-smaller vader
        vader-koala www
      ])
    end
  end
end
