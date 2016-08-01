class AddIndexPostCountryships < ActiveRecord::Migration
  def change
    add_index :post_countryships, :post_id
    add_index :post_countryships, :country_id
  end
end
