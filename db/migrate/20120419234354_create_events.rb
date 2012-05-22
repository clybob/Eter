class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false, :limit => 512
      t.integer :points, :null => false
      t.references :editorial, :null => false

      t.timestamps
    end
    add_index :events, :name
    add_index :events, :editorial_id
  end
end
