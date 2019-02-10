class Event < ApplicationRecord
  has_many :comments

  validates :name, :description, :lat, :lng, presence: true
end
