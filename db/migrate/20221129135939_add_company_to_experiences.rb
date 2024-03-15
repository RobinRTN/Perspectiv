class AddCompanyToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :company, :string
  end
end
