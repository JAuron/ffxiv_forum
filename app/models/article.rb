# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_articles_on_deleted_at  (deleted_at)
#

class Article < ApplicationRecord
	acts_as_paranoid
	
	belongs_to :user

	validates :text, presence: true

	self.per_page = 10
end
