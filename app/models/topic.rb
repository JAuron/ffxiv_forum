# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  section_id :integer
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
	belongs_to :user
	belongs_to :section
	has_many :posts, :dependent => :destroy
	accepts_nested_attributes_for :posts

	def init
		self.section_id ||= 0 
	end
end
