class CowMessagesController < ApplicationController
  helper_method :cow_message

  def create
    @cow_message = CowMessage.new(params[:cow_message])
    if @cow_message.save
      redirect_to @cow_message
    else
      render @cow_message
    end
  end

  def show
  end

  private

  def cow_message
    @cow_message ||= CowMessage.get(params[:id])
  end
end
