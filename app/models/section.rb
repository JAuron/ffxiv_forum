# == Schema Information
#
# Table name: sections
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  parent_section_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  position          :integer
#  topic_count       :integer
#  deleted_at        :datetime
#
# Indexes
#
#  index_sections_on_deleted_at  (deleted_at)
#

class Section < ApplicationRecord
	acts_as_paranoid
	
	has_many :topics, :dependent => :destroy

	has_many :children, class_name: "Section", foreign_key: "parent_section_id"
	has_one :parent, class_name: "Section", foreign_key: "parent_section_id"
end
