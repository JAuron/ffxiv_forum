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

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
