class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
       t.integer :post_id, :index => true
       t.integer :user_id, :index => true

      t.timestamps null: false
    end
  end
end
