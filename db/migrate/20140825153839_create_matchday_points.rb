class CreateMatchdayPoints < ActiveRecord::Migration
  def change
    create_table :matchday_points do |t|
      t.references :user, index: true
      t.integer :matchday
      t.integer :points

      t.timestamps
    end
  end
end
