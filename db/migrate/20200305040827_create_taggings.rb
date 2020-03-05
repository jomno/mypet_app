class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.references :symptom, foreign_key: true
      t.integer :status, default: 0
      t.references :solution, foreign_key: true

      t.timestamps
    end
  end
end
