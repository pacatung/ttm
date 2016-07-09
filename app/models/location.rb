class Location < ActiveRecord::Base
  has_many :user_locationships
  has_many :users, :through=>:user_locationships
end
