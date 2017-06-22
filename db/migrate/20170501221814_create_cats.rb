class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :code
      t.string :name
      t.date :birthday

      t.timestamps
    end
  end
end
