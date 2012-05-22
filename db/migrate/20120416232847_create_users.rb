class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :email, :null => false, :limit => 320
      t.string :oauth_token, :limit => 512
      t.string :oauth_token_secret, :limit => 512

      t.timestamps
    end
    add_index :users, :name 
    add_index :users, :email
  end
end
