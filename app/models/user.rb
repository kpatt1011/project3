class User < ActiveRecord::Base

  has_many :messages, :class_name => 'Message'
  belongs_to :group

  attr_accessible :group, :is_admin, :key, :name, :group_id

  validates :key, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
