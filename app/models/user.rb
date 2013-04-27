class User < ActiveRecord::Base

  has_many :messages

  attr_accessible :group, :is_admin, :key, :name
  
  validates :key, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
