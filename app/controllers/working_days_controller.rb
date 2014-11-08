class WorkingDaysController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @working_days = @user.working_days.order('worked_on DESC').limit(10)
  end

  def show
    @user = User.find(params[:user_id])
    @working_day = @user.working_days.find_or_create_by(worked_on: params[:id])
  end
end
