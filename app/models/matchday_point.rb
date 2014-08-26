class MatchdayPoint < ActiveRecord::Base
  belongs_to :user
  scope :ordered, -> { order('points DESC') }
  
end
