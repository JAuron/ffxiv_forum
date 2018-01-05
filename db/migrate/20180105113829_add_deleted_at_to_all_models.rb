class AddDeletedAtToAllModels < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :deleted_at, :datetime
    add_index :articles, :deleted_at

    add_column :class_lookups, :deleted_at, :datetime
    add_index :class_lookups, :deleted_at

    add_column :lodestones, :deleted_at, :datetime
    add_index :lodestones, :deleted_at

    add_column :posts, :deleted_at, :datetime
    add_index :posts, :deleted_at

    add_column :roles, :deleted_at, :datetime
    add_index :roles, :deleted_at

    add_column :sections, :deleted_at, :datetime
    add_index :sections, :deleted_at

    add_column :topics, :deleted_at, :datetime
    add_index :topics, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :user_role_assignments, :deleted_at, :datetime
    add_index :user_role_assignments, :deleted_at
  end
end
