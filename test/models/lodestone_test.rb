# == Schema Information
#
# Table name: lodestones
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  metadata     :text(65535)
#  server       :string(255)
#  free_company :string(255)
#  portrait     :string(255)
#  avatar       :string(255)
#  class_data   :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#
# Indexes
#
#  index_lodestones_on_deleted_at  (deleted_at)
#

require 'test_helper'

class LodestoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
