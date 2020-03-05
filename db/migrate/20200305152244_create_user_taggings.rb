class CreateUserTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_taggings do |t|
      t.references :symptom, foreign_key: true
      t.integer :status, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
