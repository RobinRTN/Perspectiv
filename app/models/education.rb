class Education < ApplicationRecord
  belongs_to :institution
  belongs_to :user
  validates :start_date, presence: true
  validates :degree_level, presence: true
  validates :field, presence: true
  validates :field, length: { minimum: 3 }
end
