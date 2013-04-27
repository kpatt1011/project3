class Group < ActiveRecord::Base
  attr_accessible :admin_key, :location, :messages, :name, :users
  
  validates :admin_key, :presence => true
  validates :name, :presence => true, :uniqueness => true
end
