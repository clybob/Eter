class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :uri

      t.timestamps
    end
  end
end
