module ApplicationHelper

		#Move these definitions into config files for easy addition?
		TANKS = ["Warrior", "Dark Knight", "Paladin"].freeze
		HEALERS = ["White Mage", "Scholer", "Astrologen"].freeze
		RANGED = ["Bard", "Machinist"].freeze
		CASTERS = ["Black Mage", "Summoner", "Red Mage"].freeze
		MELEE = ["Dragoon", "Monk", "Ninja", "Samurai"].freeze

	def time_formatter(datetime)
		if datetime.today?
			"Today, #{datetime.strftime('%H:%M')}"
		else
			datetime.strftime("%d %b %Y, %H:%M")
		end
	end

	def section_topics(section_id)
		topics = Topic.where(section_id: section_id).to_a
		sections = Section.find(section_id).children
		sections.each do |section|
			topics << section_topics(section.id)
		end
		topics.flatten
	end

	def topics_counter(section_id)
		section_topics(section_id).count
	end

	def last_post(topics)
		topic_ids = topics.map {|topic| topic.id}
		last_post = Post.where(topic_id: topic_ids).last
	end

	def user_last_post(user)
		Post.where(user_id: user.id).last
	end

	def class_grouper(classes)
		tanks = []
		healers = []
		ranged = []
		casters = []
		melee = []
		TANKS.each do |tank|
			tanks << classes.detect {|c| c[:c_name] == tank }
		end
		HEALERS.each do |healer|
			healers << classes.detect {|c| c[:c_name] == healer }
		end
		RANGED.each do |r|
			ranged << classes.detect {|c| c[:c_name] == r }
		end
		CASTERS.each do |caster|
			casters << classes.detect {|c| c[:c_name] == caster }
		end
		MELEE.each do |m|
			melee << classes.detect {|c| c[:c_name] == m }
		end
		a = [tanks,healers,ranged,casters,melee]
	end

	def post_user_name(post)
		if post.user
			if post.user.lodestone
				post.user.lodestone.name
			else
				post.user.email
			end
		else
			"<i>USER DELETED</i>".html_safe
		end
	end

#keep for testing purposes, should be removed once user data is recreated
	def user_class_data(classdata)
		compressed_data = []
		JSON.parse(classdata).each do |class_data|
			data = {c_name: class_data.last["name"], level: class_data.last["level"]}
			compressed_data << data
		end
		return compressed_data
	end 

	def role_form_list
		collection_check_boxes :roles, Role.all, :id, :humanized_name do |b|
			b.label { b.check_box }
		end
	end
end
