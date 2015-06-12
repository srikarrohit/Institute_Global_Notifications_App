class User < ActiveRecord::Base
	establish_connection :students_1415
	has_many :posts, dependent: :destroy
	has_many :comments
	has_many :notifications
	has_many :cats
end
