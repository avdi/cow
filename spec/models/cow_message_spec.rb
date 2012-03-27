require 'spec_helper_dm'
require 'cowsay'
require 'cow_message'

describe CowMessage do

  let(:cow) { double("Cow", :say => "COW_ART") }

  before do
    Cowsay.stub(:new_cow).and_return(cow)
    subject.cowfile = "THE_COWFILE"
    subject.message = "THE_MESSAGE"
  end

  describe '#to_s' do
    it 'renders cowsay ascii art ' do
      cow.should_receive(:say).and_return("COW_ART")
      subject.to_s.should eq("COW_ART")
    end

    it 'initializes the cow object with the cowfile' do
      Cowsay.should_receive(:new_cow).
        with(hash_including(:cowfile => "THE_COWFILE"))
      subject.to_s
    end

    it "passes message to cow object" do
      cow.should_receive(:say).with("THE_MESSAGE")
      subject.to_s
    end
  end
end
