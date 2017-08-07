# == Schema Information
#
# Table name: lodestones
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  title        :string(255)
#  server       :string(255)
#  free_company :string(255)
#  portrait     :string(255)
#  avatar       :string(255)
#  active_class :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Lodestone < ApplicationRecord
	has_one :user
end
