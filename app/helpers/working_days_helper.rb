module WorkingDaysHelper
  # 出社時間の表示
  def working_activity(working_day)
    if working_day.working_activity_id
      working_day.working_activity.activated_at.to_s(:time_jp)
    end
  end

  # 詰め込みすぎ？
  # 退勤時間の表示
  def leaving_activity(working_day)
    if working_day.leaving? && working_day.leaving_activity_id # 退勤中かつ退勤アクティビティあれば
      working_day.leaving_activity.activated_at.try(:to_s, :time_jp)
    end
  end
end
