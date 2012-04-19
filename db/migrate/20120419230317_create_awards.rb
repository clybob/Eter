class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
