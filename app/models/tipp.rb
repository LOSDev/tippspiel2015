class Tipp < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates :home_goals, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 20, :message => "Die Zahl der geschossenen Tore muss zwischen 0 und 20 liegen." }
  validates :away_goals, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 20, :message => "Die Zahl der geschossenen Tore muss zwischen 0 und 20 liegen." }
  validates :home_goals, numericality: { only_integer: true, message: "Bitte nur Zahlen eintragen" }
  validates :away_goals, numericality: { only_integer: true, message: "Bitte nur Zahlen eintragen" }
end
