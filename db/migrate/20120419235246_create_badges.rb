class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.integer :point_min
      t.boolean :unique
      t.boolean :shared
      t.string :media, :null => false
      t.string :url, :null => false
      t.references :award, :null => false
      t.references :event

      t.timestamps
    end
    add_index :badges,  :name
    add_index :badges, :award_id
    add_index :badges, :event_id
  end
end
