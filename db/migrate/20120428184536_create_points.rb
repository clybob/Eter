class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user
      t.integer :points
      t.references :event
      t.references :badge
      t.timestamps
    end
    add_index :points, :user_id
    add_index :points, :event_id
  end
end
