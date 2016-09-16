class AddColumnCountries < ActiveRecord::Migration
  def change
  	add_column :countries, :flag_file_name, :string
  	add_column :countries, :flag_content_type, :string
  	add_column :countries, :flag_file_size, :integer
  	add_column :countries, :flag_updated_at, :datetime
  end
end