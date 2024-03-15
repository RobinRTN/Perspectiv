class Institution < ApplicationRecord
  has_many :educations
  has_many :users, through: :educations
  validates :name, presence: true
  validates :description, presence: true
  validates :name, uniqueness: true
  has_one_attached :video, service: :amazon, dependent: :detach
  has_one_attached :photo
end
