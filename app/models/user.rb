class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :group, :is_admin, :key, :name, :group_id, :email, :password, :password_confirmation, :remember_me

  has_many :messages, :class_name => 'Message'
  belongs_to :group

  validates :key, :uniqueness => true
  validates :name, :presence => true
end
