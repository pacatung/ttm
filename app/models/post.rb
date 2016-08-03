class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  # accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['trip_image'].nil? }
  # accepts_nested_attributes_for :photos

  has_many :post_countryships
  has_many :countries, :through=>:post_countryships
  accepts_nested_attributes_for :countries, allow_destroy: true

  has_many :post_locationships
  has_many :locations, :through=>:post_locationships
  accepts_nested_attributes_for :locations, allow_destroy: true

  def can_edit_by_user?(user)
    user && self.user == user
  end
end
