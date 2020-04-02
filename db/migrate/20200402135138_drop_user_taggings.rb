class DropUserTaggings < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_taggings
  end
end
