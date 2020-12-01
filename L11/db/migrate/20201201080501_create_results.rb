class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :val1
      t.integer :val2
      t.integer :gcf
      t.integer :lcm
      t.text :st

      t.timestamps
    end
    add_index :results, :val1, unique: true
    add_index :results, :val2, unique: true
  end
end
