class User < ActiveRecord::Base
  has_many :working_days
end
