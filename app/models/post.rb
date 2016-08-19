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
  accepts_nested_attributes_for :locations, allow_destroy: true, :reject_if => :all_blank

  has_many :favorites
  has_many :favorited_users, :through=>:favorites, source: :user

  STATUS=["draft","published","trashcan","locked"]

  def can_edit_by_user?(user)
    user && self.user == user
  end

  # AC9
  # def find_my_favorite(user)
  #   self.favorites.where(user: :user).first
  # end

  # AC8
  def find_my_favorite(user)
    user && self.favorites.find_by_user_id( user.id )
  end
end
