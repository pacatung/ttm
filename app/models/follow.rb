class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :following_user, :class_name => "User", :foreign_key => "following_user_id"
end
