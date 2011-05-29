class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :first_name, :string, :limit => 50
      t.column :last_name, :string, :limit => 50
      t.column :age, :integer, :default => 0
      t.column :email, :string, :limit => 100, :unique => true
      t.column :username, :string, :limit => 20, :unique => true
      t.column :password, :string, :limit => 40
      t.column :role, :string, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
