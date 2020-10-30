class AddComplatedAtToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :complated_at, :datetime
  end
end
