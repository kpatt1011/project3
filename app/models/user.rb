class User < ActiveRecord::Base
  attr_accessible :group, :is_admin, :key, :name
end
