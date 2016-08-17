class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :posts, :publish_on, :datetime
  end
end
