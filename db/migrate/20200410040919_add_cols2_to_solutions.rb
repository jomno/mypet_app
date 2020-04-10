class AddCols2ToSolutions < ActiveRecord::Migration[5.2]
  def up
    add_column :solutions, :s_id, :integer
    add_column :solutions, :first_aids, :text
    add_column :solutions, :species_name, :string
    add_column :solutions, :symptom_name, :string
    add_column :solutions, :symptom_details, :text
    remove_column :solutions, :desc
    add_column :solutions, :result, :integer, default: 0
  end

  def down
    remove_column :solutions, :s_id
    remove_column :solutions, :first_aids
    remove_column :solutions, :species_name
    remove_column :solutions, :symptom_name
    remove_column :solutions, :symptom_details
    add_column :solutions, :desc, :text
    remove_column :solutions, :result
  end
end
