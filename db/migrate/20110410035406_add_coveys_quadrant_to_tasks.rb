class AddCoveysQuadrantToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :important, :boolean, :default => false
    add_column :tasks, :urgent, :boolean, :default => false
  end

  def self.down
    remove_column :tasks, :urgent
    remove_column :tasks, :important
  end
end
