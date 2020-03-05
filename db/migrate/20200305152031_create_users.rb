class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :bot_user_key
      t.string :plusfriend_user_key

      t.timestamps
    end
    add_index :users, :bot_user_key
    add_index :users, :plusfriend_user_key
  end
end
