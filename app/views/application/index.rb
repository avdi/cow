class Views::Application::Index < Erector::Widget
  def content
    div(:class => 'cow-container') do
      pre(id: 'cow-view', :class => 'cow-preview') do
        text cow_text
      end
    end
    form_for(cow_message, html: { class: "form-horizontal"} ) do |f|
      fieldset do
        legend "Make your own cow!"
        div(:class => 'control-group') do
          f.label     :message, :class => "control-label"
          div(:class => 'controls') do
            f.text_area :message, :class => 'input-xlarge', :rows => 5
          end
        end
        div(:class => 'control-group') do
          f.label     :cowfile, "Template:", :class => "control-label"
          div(:class => 'controls') do
            f.select    :cowfile, Cowsay.cowfiles, {}, :class => 'input-xlarge'
          end
        end
        div(:class => 'form-actions') do
          f.submit    'Save', :class => "btn btn-primary"
        end
      end
    end
  end

  private

  def cow_text
    cow_message.to_s
  end
end
