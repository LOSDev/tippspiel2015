class CreateTippGroups < ActiveRecord::Migration
  def change
    create_table :tipp_groups do |t|
      t.references :user, index: true
      t.string :password
      t.string :name

      t.timestamps
    end
    add_index :tipp_groups, :name, unique: true
  end
end
