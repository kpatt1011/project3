class Message < ActiveRecord::Base
  attr_accessible :associated_images, :body, :from, :title, :to
  
  validates :body, :presence => true
  validates :from, :presence => true
  validates :to, :presence => true
end
