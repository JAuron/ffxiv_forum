# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

forum_home = Section.create!(id: 0, title: 'Home')

roles_list = [
								"admin",
								"red_wing",
								"friend_wing"
								"unassigned"
						 ]

roles_list.each do |name|
  Role.create( name: name )
end