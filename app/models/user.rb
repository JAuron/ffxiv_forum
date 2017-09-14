# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  lodestone_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
	has_secure_password
	has_many :topics
	has_many :posts
  has_many :user_role_assignments
  has_many :roles, through: :user_role_assignments
	belongs_to :lodestone

  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {within: 7..254}, format: {with: email_regex}, uniqueness: true
  validates :lodestone_id, presence: true, uniqueness: true

  def has_role?(*role_names)
    self.roles.where(:name => role_names).present?
  end

end
