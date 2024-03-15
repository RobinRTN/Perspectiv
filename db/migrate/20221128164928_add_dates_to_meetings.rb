class AddDatesToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :start_date, :string
    add_column :meetings, :end_date, :string
    add_column :meetings, :start_time, :string
    add_column :meetings, :end_time, :string
  end
end
