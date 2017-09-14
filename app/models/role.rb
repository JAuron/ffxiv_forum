# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
	has_many :user_role_assignments
  has_many :users, through: :user_role_assignments
  
	validates :name, presence: true, uniqueness: true
end
