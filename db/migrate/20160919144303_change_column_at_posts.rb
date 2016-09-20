class ChangeColumnAtPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :distance, :integer, :default => 0
  end
end
