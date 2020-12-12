class AddIsInTrashToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :is_in_trash, :boolean
  end
end
