class ChangeColumnDistanceAtPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :distance, :float, :default => 0
  end
end
