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

class ClassLookup < ApplicationRecord
end
