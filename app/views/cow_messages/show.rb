class Views::CowMessages::Show < Erector::Widget
  def content
    pre(id: 'cow-view') do
      text cow_text
    end
  end

  private

  def cow_text
    cow_message.to_s
  end
end
