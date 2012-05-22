class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, :null => false
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps
    end
    add_index :users, :name 
    add_index :users, :email
  end
end
