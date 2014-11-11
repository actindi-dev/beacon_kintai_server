class User < ActiveRecord::Base
  has_many :working_days

  validates_presence_of :name, :email, :auth_token
end
