class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :associated_images, :body, :from, :title, :to
end
