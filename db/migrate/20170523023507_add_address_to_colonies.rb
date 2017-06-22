class AddAddressToColonies < ActiveRecord::Migration[5.1]
  def change
    add_column :colonies, :address, :text
  end
end
