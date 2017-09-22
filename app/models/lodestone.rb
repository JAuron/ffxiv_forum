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
#  class_data   :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Lodestone < ApplicationRecord
	has_one :user

	def class_data=(classdata)
		classes = []
		classdata.each do |c|
			unless ClassLookup.where(xivdb_id: c.first, name: c.last["name"]).first
				ClassLookup.new(
					xivdb_id: c.first,
					name: c.last["name"],
					icon_url: "https://secure.xivdb.com/img/classes/set2/#{c.last["name"].delete(' ').downcase}.png"
				).save!
			end
			local_class = ClassLookup.where(xivdb_id: c.first, name: c.last["name"]).first
			data = {
				id: local_class.id,
				name: local_class.name,
				icon: local_class.icon_url,
				level: c.last["level"]
			}
			classes << data
		end
		write_attribute(:class_data, classes.to_json)
	end

private

	def class_grouper(classdata)
	end

	def stored_class_updater(classd)
	end
end
