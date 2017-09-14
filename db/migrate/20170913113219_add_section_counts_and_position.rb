class AddSectionCountsAndPosition < ActiveRecord::Migration[5.1]
  def change
  	add_column :sections, :position, :int
  	add_column :sections, :topic_count, :int
  end
end
