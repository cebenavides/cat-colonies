class AddCatIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :cat_id, :integer
  end
end
