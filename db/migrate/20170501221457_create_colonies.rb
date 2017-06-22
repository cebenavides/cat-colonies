class CreateColonies < ActiveRecord::Migration[5.1]
  def change
    create_table :colonies do |t|
      t.text :description

      t.timestamps
    end
  end
end
