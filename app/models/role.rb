# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_roles_on_deleted_at  (deleted_at)
#

class Role < ApplicationRecord
	acts_as_paranoid
	
	has_many :user_role_assignments
  has_many :users, through: :user_role_assignments
  
	validates :name, presence: true, uniqueness: true

	def humanized_name
    "#{name.humanize}"
  end
end
