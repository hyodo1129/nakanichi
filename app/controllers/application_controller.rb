class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate_user!
    session[:user_return_to] = env['PATH_INFO']
    redirect_to user_google_omniauth_authorize_path unless user_signed_in?
  end
end
