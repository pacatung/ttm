class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  # accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['trip_image'].nil? }
  # accepts_nested_attributes_for :photos

  def can_edit_by_user?(user)
    user && self.user == user
  end
end
