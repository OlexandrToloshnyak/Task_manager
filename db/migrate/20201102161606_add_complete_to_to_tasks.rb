class AddCompleteToToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed_to, :datetime
  end
end
