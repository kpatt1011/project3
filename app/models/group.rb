class Group < ActiveRecord::Base

  has_many :users, :class_name => 'User'


  attr_accessible :admin_key, :location, :name, :messages_released, :founder_username

  validates :name, :presence => true, :uniqueness => true
end
