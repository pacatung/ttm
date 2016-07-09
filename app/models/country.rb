class Country < ActiveRecord::Base
  has_attached_file :flag, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  has_many :user_countryships
  has_many :users, :through=>:user_countryships
end