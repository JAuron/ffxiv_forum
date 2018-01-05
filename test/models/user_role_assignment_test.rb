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

require 'test_helper'

class UserRoleAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
