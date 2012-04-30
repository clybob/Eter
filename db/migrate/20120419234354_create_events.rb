class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :points
      t.references :editorial

      t.timestamps
    end
    add_index :events, :name
    add_index :events, :editorial_id
  end
end
