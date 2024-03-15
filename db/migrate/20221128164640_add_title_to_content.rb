class AddTitleToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :title, :string
  end
end
