class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :match_time
      t.string :city
      t.string :stadium
      t.string :result
      t.integer :matchday

      t.timestamps
    end
  end
end
