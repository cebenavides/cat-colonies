class AddColumnsToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :personality, :integer
    add_column :cats, :sex, :integer
    add_column :cats, :age, :integer
  end
end
