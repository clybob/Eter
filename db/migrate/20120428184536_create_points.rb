class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user, :null => false
      t.integer :points, :null => false
      t.references :event, :null => false
      t.references :badge, :null => false
      t.timestamps
    end
    add_index :points, :user_id
    add_index :points, :event_id
  end
end
