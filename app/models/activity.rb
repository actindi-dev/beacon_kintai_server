class Activity < ActiveRecord::Base
  belongs_to :working_day

  before_create do
    working_day.toggle_status
  end
end
