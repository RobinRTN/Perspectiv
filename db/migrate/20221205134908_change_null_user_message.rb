class ChangeNullUserMessage < ActiveRecord::Migration[7.0]
  def change
    change_column_null :messages, :user_id, true
  end
end
