class ApplicationController < ActionController::Base
  include GinaAuthentication::AppHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def set_device_type
    if browser.mobile? or params[:mobile].present?
      request.variant = :phone
    elsif browser.tablet? or params[:tablet].present?
      # use phone for now
      request.variant = :phone
    end
  end
end
