# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.4.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


TO DO LIST

Front Page Layout
Fix User Roles on live site
Add daily task for updating class data (or should it be weekly? :S)
LOGGING


STRUCTURE

User
	Email : String
	Password :String
	
	has_many :threads
	has_many :posts
	has_one :lodestone_data

Topic
	Title : String
	User_ID : Int

	belongs_to :user
	has_many :posts

Post
	Text : Text
	User_ID : Int
	Thread_ID: Int

	belongs_to :user
	belongs_to :thread

Lodestone data
	User_ID : Int
	API_link : String

	belongs_to :user