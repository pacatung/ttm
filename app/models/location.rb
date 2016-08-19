class Location < ActiveRecord::Base

  validates_presence_of :location

  has_many :user_locationships
  has_many :users, :through=>:user_locationships

  has_many :post_locationships
  has_many :posts, :through=>:post_locationships
end
