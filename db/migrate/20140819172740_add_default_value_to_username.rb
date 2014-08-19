class AddDefaultValueToUsername < ActiveRecord::Migration
  def up
    change_column :users, :points, :integer, :default => 0
  end

  def down
    change_column :users, :points, :integer, :default => nil
  end
end
