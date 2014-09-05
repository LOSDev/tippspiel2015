class Tipp < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates :home_goals, :numericality => { :greater_than_or_equal_to => 0, 
    :less_than_or_equal_to => 15, 
    :message => "Die Zahl der geschossenen Tore muss zwischen 0 und 15 liegen." }
  validates :away_goals, :numericality => { :greater_than_or_equal_to => 0, 
    :less_than_or_equal_to => 15, 
    :message => "Die Zahl der geschossenen Tore muss zwischen 0 und 15 liegen." }
  validates :home_goals, numericality: { only_integer: true, message: "Bitte nur Zahlen eintragen" }
  validates :away_goals, numericality: { only_integer: true, message: "Bitte nur Zahlen eintragen" }

  validates_presence_of :match_id, :message => "Der Tipp kann keinem Spiel zugeordnet werden."
  validates_presence_of :home_goals, :message => "No Home Goals"
  validates_presence_of :away_goals, :message => "No away Goals"
  validates_presence_of :user_id, :message => "Der Tipp kann keinem Tipper zugeordnet werden. Bitte loggen Sie sich ein."

end
