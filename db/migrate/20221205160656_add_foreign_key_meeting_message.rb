class AddForeignKeyMeetingMessage < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :meeting, foreign_key: true
  end
end
