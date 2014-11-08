class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :required_login

  def required_login
    unless view_context.current_user
      redirect_to root_url, notice: 'ログインが必要です'
    end
  end
end
