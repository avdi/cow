require 'rack/test'
require 'sinatra'
require 'cow'

set :environment, :test

describe "The Cow app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
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
end
