class AddIndexUserCountryships < ActiveRecord::Migration
  def change
    add_index :user_countryships, :user_id
    add_index :user_countryships, :country_id
  end
end
