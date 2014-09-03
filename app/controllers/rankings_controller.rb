class RankingsController < ApplicationController
  def overall
    @top100 = User.limit(100).ordered
  end

  def matchday
    @matchday = params[:id]
    if @matchday == "0"
      matches = Match.all
      matches.each do |match|
        if DateTime.now < match.match_time
          redirect_to rankings_matchday_show_path(match.matchday - 1) if match.matchday > 1
        break
      end
    end
    end
    @top100 = MatchdayPoint.includes(:user).where(matchday: @matchday).limit(100).ordered
  end

  def tipp_group
    tipp_group_id = params[:id].to_i
    if tipp_group_id > 0
      @tipp_group = TippGroup.find(tipp_group_id)
      @users =  []
      @users << @tipp_group.user
      @users << @tipp_group.users
      @users = @users.flatten.sort_by {|user| user.rank}
      
    end
    
  end
end
