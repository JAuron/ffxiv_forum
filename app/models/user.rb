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
#  deleted_at      :datetime
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#

class User < ApplicationRecord
  acts_as_paranoid

  before_destroy :destroy_lodestone
  before_restore :restore_lodestone
  
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

  private

 def destroy_lodestone
   self.lodestone.destroy
 end

 def restore_lodestone
   Lodestone.deleted.find(self.lodestone_id).restore
 end

end
