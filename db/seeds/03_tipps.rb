Match.all.each do |match|
  Tipp.create(user_id: User.find_by_username("Heimtipper").id, home_goals: 2, away_goals: 1, match_id: match.id)
  Tipp.create(user_id: User.find_by_username("Unentschieden").id, home_goals: 1, away_goals: 1, match_id: match.id)
  Tipp.create(user_id: User.find_by_username("Zufall").id, home_goals: rand(4), away_goals: rand(3), match_id: match.id)
  Tipp.create(user_id: User.find_by_username("FCBFan").id, home_goals: 2, away_goals: 1, match_id: match.id)

end