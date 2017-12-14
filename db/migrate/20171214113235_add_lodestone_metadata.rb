class AddLodestoneMetadata < ActiveRecord::Migration[5.1]
  def change
  	rename_column :lodestones, :title, :metadata
  	change_column :lodestones, :metadata, :text
  end
end
