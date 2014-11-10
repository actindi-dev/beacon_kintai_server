class UsersController < ApplicationController
  skip_before_action :required_login

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def new
    @user =  User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to users_path, notice: 'ユーザを新規作成しました。'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_param)
      redirect_to users_path, notice: 'ユーザを新規作成しました。'
    else
      render :edit
    end
  end

  private
  def user_param
    params.require(:user).permit!
  end
end
