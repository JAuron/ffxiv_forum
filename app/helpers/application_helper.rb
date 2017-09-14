module ApplicationHelper

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


#Can be made prettier? Remove the checks of created_at, instead use post_id?
	def last_post(topics)
		topic_ids = topics.map {|topic| topic.id}
		last_post = Post.where(topic_id: topic_ids).last
	end
end
