class Meeting < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  belongs_to :mentor, class_name: "User", foreign_key: "mentor_id"
  validates :starting, presence: true
  validates :ending, presence: true
end
