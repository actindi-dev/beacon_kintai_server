class SessionsController < ApplicationController
  skip_before_action :required_login, only: :create

  def create
    @user = User.find_by(email: user_param[:email], auth_token: user_param[:auth_token])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'ログインできました'
    else
      render inline: 'ログインに失敗しました', layout: false, status: 403
    end
  end

  def destroy
  end

  private
  def user_param
    params[:user] || {}
  end
end
