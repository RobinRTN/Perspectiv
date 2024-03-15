class ChangeColumnTypeMeeting < ActiveRecord::Migration[7.0]
  def change
    remove_column :meetings, :starting
    remove_column :meetings, :ending
    add_column :meetings, :starting, :datetime, null: false
    add_column :meetings, :ending, :datetime, null: false
  end
end
