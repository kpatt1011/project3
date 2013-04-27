class User < ActiveRecord::Base
  attr_accessible :group, :is_admin, :key, :name
  
  validates :key, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
