class Views::Application::Index < Erector::Widget
  def content
    pre(id: 'cow-view') do
      text cow_text
    end
    form_for(cow_message) do |f|
      f.text_area :message
      f.select    :cowfile, Cowsay.cowfiles
    end
  end

  private

  def cow_text
    cow_message.to_s
  end
end
