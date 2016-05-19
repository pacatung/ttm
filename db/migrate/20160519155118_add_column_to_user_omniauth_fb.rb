class AddColumnToUserOmniauthFb < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :fb_token, :string
    add_column :users, :fb_expires_at, :datetime

    add_index :users, :uid, :unique => true
  end
end