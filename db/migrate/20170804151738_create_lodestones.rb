class CreateLodestones < ActiveRecord::Migration[5.1]
  def change
    create_table :lodestones do |t|
      t.string :name
      t.string :title
      t.string :server
      t.string :free_company
      t.string :portrait
      t.string :avatar
      t.text :active_class

      t.timestamps
    end
  end
end
