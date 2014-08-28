class StaticPagesController < ApplicationController
  def rules
  end

  def home
    matches = Match.all
    matches.each do |match|
      if DateTime.now < match.match_time
        @matchday = match.matchday
        break
      end
    end
    @matches = Match.where(matchday: @matchday)
  end
end
