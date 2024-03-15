class RemoveColumnsInMeetings < ActiveRecord::Migration[7.0]
  def change
    remove_column :meetings, :start_date
    remove_column :meetings, :end_date
    remove_column :meetings, :start_time
    remove_column :meetings, :end_time
  end
end
