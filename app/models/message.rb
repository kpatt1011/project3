class Message < ActiveRecord::Base
  attr_accessible :associated_images, :body, :from, :title, :to
end
