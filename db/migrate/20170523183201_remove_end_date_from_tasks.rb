class RemoveEndDateFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :end_date, :datetime
  end
end
