class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :origin
      t.string :destionation
      t.date :trip_date
      t.integer :distancece
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
