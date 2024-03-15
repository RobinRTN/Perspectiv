class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, optional: true
  belongs_to :meeting, optional: true
  validates :content, presence: true

  def sender?(a_user)
    user.id == a_user.id
  end

end
