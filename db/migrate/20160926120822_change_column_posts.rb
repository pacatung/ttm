class ChangeColumnPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :status, :string, :default => "published"
  end
end
