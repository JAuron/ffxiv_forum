class AddAllLodestoneClassData < ActiveRecord::Migration[5.1]
  def change
  	rename_column :lodestones, :active_class, :class_data
  end
end
