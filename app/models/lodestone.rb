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

class Lodestone < ApplicationRecord
	acts_as_paranoid
	
	has_one :user

	CLASSIFICATIONS = ['Tank', 'Healer', 'Ranged', 'Caster', 'Melee', 'Crafter', 'Gatherer', 'Unclassified']

	def class_data=(classes_list)
		classes = {}
		CLASSIFICATIONS.each do |classification|
			group = []
			ClassLookup.where(classification: classification).each do |class_name|
				id = class_name.xivdb_id.to_s
				unless class_name["name"] == 'Scholar'
					group << build_each_class_data(classes_list[id])
					classes_list.delete(id) 
				else
					group << build_each_class_data(classes_list[id], true)
				end
			end
			classes[classification.to_sym] = group
		end
		write_attribute(:class_data, classes.to_json)
		unless classes_list.empty?
			classes_list.each do |new_class|
				unless ClassLookup.where(xivdb_id: new_class.first).first
					ClassLookup.new(
							xivdb_id: new_class.first.to_i,
							name: new_class.last["name"],
							icon_url: "https://secure.xivdb.com/img/classes/set2/#{new_class.last["name"].delete(' ').downcase}.png",
							classification: 'Unclassified'
						).save!
				end
			end
		end
	end

	def metadata=(data)
		metadata = {}
		metadata[:title] = data["title"]
		metadata[:gender] = data["gender"]
		metadata[:race] = data["race"]
		metadata[:clan] = data["clan"]
		metadata[:guardian] = {name: data.dig("guardian", "name"), icon: data.dig("guardian", "icon")}
		metadata[:grand_company] = {name: data.dig("grand_company", "name"), icon: data.dig("grand_company", "icon"), rank: data.dig("grand_company", "rank")}
		write_attribute(:metadata, metadata.to_json)
	end

private

	def build_each_class_data(classdata, scholar=false)
			unless scholar
				data = {
					name: classdata["name"],
					icon:  "https://secure.xivdb.com/img/classes/set2/#{classdata["name"].delete(' ').downcase}.png",
					level: classdata["level"]
				}
			else
				data = {
					name: 'Scholar',
					icon:  "https://secure.xivdb.com/img/classes/set2/scholar.png",
					level: classdata["level"] < 30 ? 0 : classdata["level"]
				}
			end
	end
	
end
