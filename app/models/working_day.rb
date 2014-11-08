class WorkingDay < ActiveRecord::Base
  enum status: %i(working leaving)

  has_many :activities

  belongs_to :user
  belongs_to :working_activity, class: Activity
  belongs_to :leaving_activity, class: Activity

  after_create do
    self.leaving!
  end

  def to_param
    worked_on.to_s
  end

  # FIXME なんか変
  def toggle_status
    leaving! && return if working?
    working! && return if leaving?
  end
end
