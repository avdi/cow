module Cowsay
  describe Cow do
    context 'given a cowfile' do
      subject { Cow.new(:cowfile => 'MYCOW', :io => io) }
      let(:io) { double("IO") }

      it 'sends the appropriate cowfile flags to the system' do
        io.should_receive(:popen) do |command|
          command.each_cons(2).should include(%w[-f MYCOW])
          "THE_COW"
        end
        subject.say("Hello")
      end
    end
  end
end
