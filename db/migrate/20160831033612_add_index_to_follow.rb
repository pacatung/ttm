class AddIndexToFollow < ActiveRecord::Migration
  def change
  	add_index :follows, :user_id
  	add_index :follows, :following_user_id
  end
end
