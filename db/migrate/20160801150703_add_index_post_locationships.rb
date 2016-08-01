class AddIndexPostLocationships < ActiveRecord::Migration
  def change
    add_index :post_locationships, :post_id
    add_index :post_locationships, :location_id
  end
end
