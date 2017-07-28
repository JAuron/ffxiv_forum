# == Schema Information
#
# Table name: sections
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  parent_section_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Section < ApplicationRecord
	has_many :topics, :dependent => :destroy
end
