class CreateTipps < ActiveRecord::Migration
  def change
    create_table :tipps do |t|
      t.string :result
      t.references :user, index: true
      t.references :match, index: true
      t.integer :points

      t.timestamps
    end
  end
end
