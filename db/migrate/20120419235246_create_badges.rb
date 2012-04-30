class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.integer :point_min
      t.boolean :unique
      t.boolean :shared
      t.string :media
      t.string :url
      t.references :award
      t.references :event

      t.timestamps
    end
    add_index :badges,  :name
    add_index :badges, :award_id
    add_index :badges, :event_id
  end
end
