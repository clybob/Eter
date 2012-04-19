class CreatePremios < ActiveRecord::Migration
  def change
    create_table :premios do |t|
      t.string :award

      t.timestamps
    end
  end
end
