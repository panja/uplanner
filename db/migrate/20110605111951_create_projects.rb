class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.column :title, :string, :limit => 50
      t.column :description, :string, :limit => 3000
      t.column :author_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
