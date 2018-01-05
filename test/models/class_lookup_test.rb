# == Schema Information
#
# Table name: class_lookups
#
#  id             :integer          not null, primary key
#  xivdb_id       :integer
#  name           :string(255)
#  icon_url       :string(255)
#  classification :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  deleted_at     :datetime
#
# Indexes
#
#  index_class_lookups_on_deleted_at  (deleted_at)
#

require 'test_helper'

class ClassLookupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
