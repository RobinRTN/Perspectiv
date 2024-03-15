class Tag < ApplicationRecord
  has_many :preferences
  validates :name, presence: true
end
