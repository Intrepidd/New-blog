class CreateUsers < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
    create_table :users do |t|
      t.string :username
      t.string :password
      t.timestamps
    end
  end

  def self.down
    remove_column :posts, :user_id
    drop_table :users
  end
end

