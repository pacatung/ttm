class AddAttachmentFlagToCountry < ActiveRecord::Migration

  def self.up
    change_table :countries do |t|
      t.attachment :flag
    end
  end
end