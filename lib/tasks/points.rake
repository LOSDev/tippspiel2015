namespace :points do

  desc "calculate points for tipps"
  task :tipps => :environment do
    p "Calculating Points for tipps"
    Match.where("home_goals IS NOT NULL AND away_goals IS NOT NULL").each do |match|
      match_id = match.id
      Tipp.where(match_id: match_id).each do |tipp|
        tipp.points = calculate_points(match, tipp)
        tipp.save
      end
    end
  end

  desc "calculate points for users"
  task :users => :tipps do
    p "Calculating Points for all Users"
    User.all.each do |user|
      points = Tipp.where(user_id: user.id).sum(:points)
      p "#{user.username}: #{points} Points."
      user.points = points
      user.save
    end
  end

  desc "update matches and points"
  task :update => ["matches:load", :users]

  def calculate_points match, tipp
    return 3 if match.home_goals == tipp.home_goals and match.away_goals == tipp.away_goals
    return 2 if match.home_goals - match.away_goals == tipp.home_goals - tipp.away_goals
    return 1 if match.home_goals - match.away_goals > 0 and tipp.home_goals - tipp.away_goals > 0
    return 1 if match.home_goals - match.away_goals < 0 and tipp.home_goals - tipp.away_goals < 0
    return 0
  end
end