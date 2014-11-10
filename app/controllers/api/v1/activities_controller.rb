class Api::V1::ActivitiesController < Api::V1::ApiController
  def create
    @user = User.find(params[:user_id])
    @working_day = @user.working_days.find_or_create_by(worked_on: params[:working_day_id])
    @activity = @working_day.activities.build(activated_at: DateTime.now)
    if @activity.save
      render nothing: true, status: :ok
    else
      render nothing: true, status: 403
    end
  end
end