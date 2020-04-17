class AddCustomResultToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :custom_result, :string
  end
end
