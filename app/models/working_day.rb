class WorkingDay < ActiveRecord::Base
  enum status: [
    :working,
    :leaving
  ]

  belongs_to :user

  after_create do
    self.working!
  end
end
