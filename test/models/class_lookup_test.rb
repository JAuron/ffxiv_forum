# == Schema Information
#
# Table name: class_lookups
#
#  id         :integer          not null, primary key
#  xivdb_id   :integer
#  name       :string(255)
#  icon_url   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ClassLookupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
