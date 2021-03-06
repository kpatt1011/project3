class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :associated_images, :body, :from, :title, :to, :user_id
  
  validates :body, :presence => true
  validates :from, :presence => true
  validates :to, :presence => true
end
