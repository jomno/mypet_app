class ChangeColToSolutions < ActiveRecord::Migration[5.2]
  def change
    change_column :solutions, :species_name, :integer, default: 0
    change_column :solutions, :symptom_name, :integer, default: 0
  end
end
