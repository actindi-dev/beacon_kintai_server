class WorkingDaysController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @working_day = @user.working_days.find_or_create_by(worked_on: params[:id])
  end
end
