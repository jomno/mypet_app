class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.references :species, foreign_key: true

      t.timestamps
    end
  end
end
