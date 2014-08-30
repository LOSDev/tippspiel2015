class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.references :user, index: true
      t.references :tipp_group, index: true

      t.timestamps
    end
  end
end
