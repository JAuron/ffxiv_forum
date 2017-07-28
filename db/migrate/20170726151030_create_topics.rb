class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :section_id
      t.string :title

      t.timestamps
    end
  end
end
