require "#{Rails.root}/lib/tasks/task_helper"

namespace :points do

  desc "calculate points for tipps"
  task :tipps => :environment do
    start_time = Time.now
    p "Calculating Points for tipps"
    Match.where("home_goals IS NOT NULL AND away_goals IS NOT NULL").each do |match|
      match_id = match.id
      Tipp.where(match_id: match_id, points: nil).each do |tipp|
        tipp.points = calculate_points(match, tipp)
        tipp.save
      end
    end
    end_time = Time.now
    p end_time - start_time
  end

  desc "calculate points for users"
  task :users => :tipps do
    start_time = Time.now
    p "Calculating Points for all Users"
    User.all.each do |user|
      points = Tipp.where(user_id: user.id).sum(:points)
      user.points = points
      user.save
    end
    end_time = Time.now
    p end_time - start_time
  end

  desc "Ranking Users"
  task :rank => :users do
    start_time = Time.now
    p "Inserting Ranking into database"
    
    User.all.ordered.each_with_index do |user, index|
      user.rank = index + 1
      user.save
    end
    end_time = Time.now
    p end_time - start_time
  end

  desc "Calculating points per Matchday"
  task :calculate => :rank do
    start_time = Time.now
    include HelperFunctions

    p "Calculating points per Matchday"
    matchday = HelperFunctions::determine_matchday
    p "#{matchday} Spieltage"
    User.all.each do |user|
      (1..matchday).each do |n|
        points = Tipp.joins(:match).where(matches:{matchday: n }).where(user_id: user.id).sum(:points)
        p "#{points} Punkte."
        entry = MatchdayPoint.find_or_create_by(matchday: n, user_id: user.id)
        unless entry.id
          entry.points = points
          entry.save
        end
      end
    end
    end_time = Time.now
    p end_time - start_time
  end

  desc "update matches and points"
  task :update => ["matches:download", :calculate]

  def calculate_points match, tipp
    return 3 if match.home_goals == tipp.home_goals and match.away_goals == tipp.away_goals
    return 2 if match.home_goals - match.away_goals == tipp.home_goals - tipp.away_goals
    return 1 if match.home_goals - match.away_goals > 0 and tipp.home_goals - tipp.away_goals > 0
    return 1 if match.home_goals - match.away_goals < 0 and tipp.home_goals - tipp.away_goals < 0
    return 0
  end

  
end