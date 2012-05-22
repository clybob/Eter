class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name, :null => false, :limit => 100
      t.string :description, :limit => 512
      t.string :url, :limit => 1024

      t.timestamps
    end
  end
end
