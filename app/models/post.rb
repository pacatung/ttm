class Post < ActiveRecord::Base
  has_many :photos
  # accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['trip_image'].nil? }
  # accepts_nested_attributes_for :photos
end
