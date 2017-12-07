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
Forum Layout
Post Markdown
Handling Nil Exceptions
Restricting User Access based on Role

Front Page
Forms for New post/section/topic - Work with markdown

USER PAGE - 
	Classes + Levels
	Title
	Roles
	Last Post
	Picture
	Joined Date
	Number of posts


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