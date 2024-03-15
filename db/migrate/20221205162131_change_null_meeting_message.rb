class ChangeNullMeetingMessage < ActiveRecord::Migration[7.0]
  def change
    change_column_null :messages, :meeting_id, true
  end
end
