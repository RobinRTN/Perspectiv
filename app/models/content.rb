class Content < ApplicationRecord
  belongs_to :user
  has_one_attached :video, service: :amazon, dependent: :detach
end
