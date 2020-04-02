class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.integer :position
      t.boolean :is_end, default: false

      t.timestamps
    end
  end
end
