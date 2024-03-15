class AddTimesToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :starting, :string
    add_column :meetings, :ending, :string
  end
end
