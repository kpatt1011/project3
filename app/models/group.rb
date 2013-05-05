class Group < ActiveRecord::Base

  has_many :users, :class_name => 'User'


  attr_accessible :admin_key, :location, :name

  validates :admin_key, :presence => true
  validates :name, :presence => true, :uniqueness => true
end
