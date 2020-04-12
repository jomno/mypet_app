class AddCauseToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :cause, :text
  end
end
