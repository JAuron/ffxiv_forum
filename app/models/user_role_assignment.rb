# == Schema Information
#
# Table name: user_role_assignments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserRoleAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
