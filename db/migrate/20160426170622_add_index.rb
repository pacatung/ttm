class AddIndex < ActiveRecord::Migration
  def change
    add_index :photos, :post_id
  end
end
