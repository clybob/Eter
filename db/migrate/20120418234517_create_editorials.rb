class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :uri, :null => false, :limit => 1024

      t.timestamps
    end
  end
end
