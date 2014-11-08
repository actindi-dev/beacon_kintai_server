module WorkingDaysHelper
  def leaving_activity(working_day)
    if working_day.leaving? && working_day.leaving_activity_id
      working_day.leaving_activity.try!(:formated_activated_at)
    end
  end

  def working_activity(working_day)
    working_day.working_activity.try!(:formated_activated_at)
  end
end
