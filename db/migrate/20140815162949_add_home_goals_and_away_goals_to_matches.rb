class AddHomeGoalsAndAwayGoalsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :home_goals, :integer
    add_column :matches, :away_goals, :integer
    remove_column :matches, :result

    add_column :tipps, :home_goals, :integer
    add_column :tipps, :away_goals, :integer
    remove_column :tipps, :result
  end
end
