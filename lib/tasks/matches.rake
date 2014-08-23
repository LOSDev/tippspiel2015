require 'open-uri'
namespace :matches do

  desc "load matches data"
  task :load => :environment do
    p "Downloading and Updating Matches"
    update_matches
  end
end
def update_matches
  (1..2).each do |n|
    p "#{n}. Spieltag"
    url = "http://openligadb-json.heroku.com/api/matchdata_by_group_league_saison?group_order_id=#{n}&league_saison=2014&league_shortcut=bl1"
    open(url) do |f|
      f.base_uri
      if f.status[0] == "200"
        response = f.read
        parsed = JSON.parse(response)
        parsed["matchdata"].each do |match|
          home_team = match["name_team1"]
          away_team = match["name_team2"]
          match_time = match["match_date_time"]
          match_time_utc = match["match_date_time_utc"]
          mt = DateTime.parse(match_time_utc)
          home_icon = match["icon_url_team1"]
          away_icon = match["icon_url_team1"]
          city = match["location"]["location_city"]
          stadium = match["location"]["location_stadium"]
          home_goals = match["points_team1"]
          away_goals = match["points_team2"]

          db_match = Match.where(home_team: home_team).where(away_team: away_team).first
          if db_match
            db_match.match_time = mt
            db_match.city = city
            db_match.stadium = stadium
            db_match.home_goals = home_goals if home_goals != "-1"
            db_match.away_goals = away_goals if away_goals != "-1"
            db_match.save
            p "updated #{home_team} vs. #{away_team}"
          else
            Match.create(home_team: home_team, away_team: away_team, match_time: mt, matchday: n, city: city, stadium: stadium)
          end

            
        end
      end
    end
  end
end
