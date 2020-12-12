class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :owner
      t.string :title
      t.text :content
      t.boolean :is_private
      t.string :group

      t.timestamps
    end
  end
end
