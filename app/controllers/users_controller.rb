class UsersController < ApplicationController
  skip_before_action :required_login

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @working_days = @user.working_days.order('worked_on DESC').limit(10)
  end
end
