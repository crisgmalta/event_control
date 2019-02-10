class User < ApplicationRecord
  has_many :comments
  has_many :reports

  validates :name, :email, :password, presence: true
end
