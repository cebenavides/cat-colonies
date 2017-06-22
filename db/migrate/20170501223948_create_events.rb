class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :description
      t.date :date_of_event
      t.boolean :solved
      t.text :solution_description

      t.timestamps
    end
  end
end
