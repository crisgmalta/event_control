class User < ApplicationRecord
	has_many :comments
	has_many :reports
	validates :name, presence:true
	validates :email, presence:true
	validates :password, presence:true
end
