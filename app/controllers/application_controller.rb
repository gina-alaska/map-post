class ApplicationController < ActionController::Base
  include GinaAuthentication::AppHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    begin
      if signed_in?
        redirect_to :back, :alert => exception.message
      else
        session[:redirect_back_to] = request.original_url
        redirect_to login_path
      end
    rescue ActionController::RedirectBackError
      redirect_to root_path
    end
  end

  protected

  def set_device_type
    if request.xhr?
      request.variant = :ajax
    elsif browser.mobile? or params[:mobile].present?
      request.variant = :phone
    elsif browser.tablet? or params[:tablet].present?
      # use phone for now
      request.variant = :phone
    end
  end
end
