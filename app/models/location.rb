class Location < ActiveRecord::Base
  has_many :user_locationships
  has_many :users, :through=>:user_locationships

  has_many :post_locationships
  has_many :posts, :through=>:post_locationships
end
