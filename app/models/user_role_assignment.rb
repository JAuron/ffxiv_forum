# == Schema Information
#
# Table name: user_role_assignments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_user_role_assignments_on_deleted_at  (deleted_at)
#

class UserRoleAssignment < ApplicationRecord
	acts_as_paranoid
	
	validates_uniqueness_of :role_id, scope: :user_id, message: "already exists for that user"

  belongs_to :user
  belongs_to :role
end
