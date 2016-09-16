class Country < ActiveRecord::Base
  has_attached_file :flag, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  # validates_presence_of :country

  has_many :user_countryships
  has_many :users, :through=>:user_countryships

  has_many :post_countryships
  has_many :posts, :through=>:post_countryships

  # belongs_to :post
  has_many :users, :through=>:post_countryships
end
