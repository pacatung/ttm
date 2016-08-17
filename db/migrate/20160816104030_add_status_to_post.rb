class AddStatusToPost < ActiveRecord::Migration
  def change
    add_column :posts, :status, :string, :default => "draft"
    add_column :posts, :publish_on, :date
  end
end
