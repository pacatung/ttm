class Photo < ActiveRecord::Base
  belongs_to :post

  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  # has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.jpg"

  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
end
