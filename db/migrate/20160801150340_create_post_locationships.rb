class CreatePostLocationships < ActiveRecord::Migration
  def change
    create_table :post_locationships do |t|
      t.integer :post_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end