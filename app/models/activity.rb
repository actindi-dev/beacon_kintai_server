class Activity < ActiveRecord::Base
  belongs_to :working_day

  # FIXME createであってる？saveとか
  after_save { activated_at || update_column(:activated_at, created_at) }
  after_create { working_day.toggle_status }
  after_create :set_working_activity
  after_create :set_leaving_activity

  # callbacks
  def set_working_activity
    if working_day.working_activity_id.nil?
      working_day.update_column(:working_activity_id, id)
    end
  end

  def set_leaving_activity
    if working_day.leaving?
      working_day.update_column(:leaving_activity_id, id)
    end
  end

  def formated_activated_at
    activated_at.to_s(:time_jp) if activated_at
  end
end
