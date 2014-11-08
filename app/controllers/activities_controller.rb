class ActivitiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @working_day = @user.working_days.find_or_create_by(worked_on: params[:working_day_id])
    @activity = @working_day.activities.build(activated_at: DateTime.now)
  end

  def create
    @user = User.find(params[:user_id])
    @working_day = @user.working_days.find_or_create_by(worked_on: params[:working_day_id])
    @activity = @working_day.activities.build(activity_param)
    if @activity.save
      redirect_to [@user, @working_day], notice: '作成しました'
    else
      render :new
    end
  end

  private
  def activity_param
    params.require(:activity).permit!
  end
end
