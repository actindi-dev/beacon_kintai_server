class UsersController < ApplicationController
  skip_before_action :required_login

  def index
    @users = User.all
  end
end
