class PostLocationship < ActiveRecord::Base
  belongs_to :post
  belongs_to :location
end
