class AddContentToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :content, :text
  end
end
