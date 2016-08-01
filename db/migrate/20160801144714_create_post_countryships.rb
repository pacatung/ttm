class CreatePostCountryships < ActiveRecord::Migration
  def change
    create_table :post_countryships do |t|
      t.integer :post_id
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
