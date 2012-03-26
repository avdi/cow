require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery

  helper_method :cow_message

  def index
  end

  private

  def cow_message
    @cow ||= CowMessage.new
  end
end
