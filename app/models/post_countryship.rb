class PostCountryship < ActiveRecord::Base
  belongs_to :post
  belongs_to :country
end
