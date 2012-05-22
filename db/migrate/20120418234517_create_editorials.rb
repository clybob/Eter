class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :uri, :null => false

      t.timestamps
    end
  end
end
