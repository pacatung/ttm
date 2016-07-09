class CreateUserCountryships < ActiveRecord::Migration
  def change
    create_table :user_countryships do |t|
      t.integer :user_id
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
