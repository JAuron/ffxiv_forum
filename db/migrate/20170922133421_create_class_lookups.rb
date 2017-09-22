class CreateClassLookups < ActiveRecord::Migration[5.1]
  def change
    create_table :class_lookups do |t|
      t.integer :xivdb_id
      t.string :name
      t.string :icon_url

      t.timestamps
    end
  end
end
