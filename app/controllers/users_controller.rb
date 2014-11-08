class UsersController < ApplicationController
  skip_before_action :required_login

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
