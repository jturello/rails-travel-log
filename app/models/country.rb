class Country < ActiveRecord::Base
  has_many :destinations, dependent: :destroy
  has_many :posts, as: :commentable

  validates_associated :destinations, :posts
  validates :name, :blurb, :description, :presence => true

end
