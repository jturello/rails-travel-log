class User < ApplicationRecord
  has_many :posts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :uniqueness => true
  validates :username, :password_confirmation, :presence => true
  validates_associated :posts
end
