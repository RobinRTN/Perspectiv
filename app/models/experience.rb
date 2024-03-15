class Experience < ApplicationRecord
  SALARY_RANGES = ["< 20 000€", "20 000€ - 40 000€", "40 000€ - 60 000€", "60 000€ - 80 000€", "80 000€ - 100 000€", "> 100 000€"]

  belongs_to :user
  validates :position, presence: true
  validates :sector, presence: true
  validates :industry, presence: true
  validates :start_date, presence: true
  validates :company, presence: true
end
