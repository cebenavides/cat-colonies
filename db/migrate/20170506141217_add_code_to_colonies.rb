class AddCodeToColonies < ActiveRecord::Migration[5.1]
  def change
    add_column :colonies, :code, :string
  end
end
