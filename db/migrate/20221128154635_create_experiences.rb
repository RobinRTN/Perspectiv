class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :position
      t.string :sector
      t.string :industry
      t.date :start_date
      t.date :end_date
      t.string :salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
