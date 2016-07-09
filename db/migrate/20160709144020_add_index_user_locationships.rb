class AddIndexUserLocationships < ActiveRecord::Migration
  def change
      add_index :user_locationships, :user_id
      add_index :user_locationships, :location_id
  end
end
