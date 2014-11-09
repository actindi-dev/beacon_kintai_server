class UsersController < ApplicationController
  skip_before_action :required_login

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
end
