require 'cowsay'
describe Cowsay::Cow do
  describe "#say" do
    it 'returns an ascii cow' do
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
      result = subject.say("Hello").strip
      result.should eq(expected)
    end
  end
end
