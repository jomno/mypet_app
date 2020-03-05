class AddLinkToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :link, :string
  end
end
