# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  user_id    :integer
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_posts_on_deleted_at  (deleted_at)
#

class Post < ApplicationRecord
	acts_as_paranoid
	
	belongs_to :user
	belongs_to :topic

	validates :text, presence: true

	self.per_page = 10
end
