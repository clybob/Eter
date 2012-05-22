class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name, :null => false, :limit => 100
      t.string :description, :null => false, :limit => 512
      t.integer :point_min
      t.boolean :unique
      t.boolean :shared
      t.string :media, :null => false, :limit => 512
      t.string :url, :null => false, :limit => 1024
      t.references :award, :null => false
      t.references :event

      t.timestamps
    end
    add_index :badges,  :name
    add_index :badges, :award_id
    add_index :badges, :event_id
  end
end
