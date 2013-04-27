class User < ActiveRecord::Base

  has_many :messages

  attr_accessible :group, :is_admin, :key, :name
end