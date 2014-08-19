class TippsController < ApplicationController
  before_action :set_tipp, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tipps
  # GET /tipps.json
  def index
    matches = Match.all
    matches.each do |match|
      if DateTime.now < match.match_time
        redirect_to edit_tipp_path(match.matchday)
        break
      end
    end
  end

  # GET /tipps/1
  # GET /tipps/1.json
  def show
  end

  # GET /tipps/new
  def new
    @tipp = Tipp.new
  end

  # GET /tipps/1/edit
  def edit
    @days = %w(So Mo Di Mi Do Fr Sa)

    @matchday = params[:id]
  end

  # POST /tipps
  # POST /tipps.json
  def create
    if current_user
      @formerrors = []
      tipps = params[:tipps]
      tipps = tipps.values if tipps.is_a?(Hash)
      matchday = Match.find(tipps.last["match_id"]).matchday
      tipps.each do |tipp|
        match_id = tipp["match_id"]
        home_goals = tipp["home_goals"]
        away_goals = tipp["away_goals"]
        @tipp = Tipp.find_or_initialize_by(match_id: match_id, user_id: current_user)
        @tipp.home_goals = home_goals
        @tipp.away_goals = away_goals
        @tipp.user_id = current_user.id

        if check_tipp(tipp)
          p @tipp
          @formerrors << @tipp.errors.messages.values unless @tipp.save
        end
       

      end
      @formerrors = create_ul
      redirect_to edit_tipp_path(matchday), notice: @formerrors
    end
  end

  # PATCH/PUT /tipps/1
  # PATCH/PUT /tipps/1.json
  def update
    @tipps = params[:tipps].permit(:home_goals, :away_goals, :user_id, :match_id, :points)
    respond_to do |format|
      if @tipp.update(tipp_params)
        format.html { redirect_to @tipp, notice: 'Tipp was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipp }
      else
        format.html { render :edit }
        format.json { render json: @tipp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipps/1
  # DELETE /tipps/1.json
  def destroy
    @tipp.destroy
    respond_to do |format|
      format.html { redirect_to tipps_url, notice: 'Tipp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_tipp(tipp)
      return false if tipp["home_goals"] == "" or tipp["away_goals"] == "" or !tipp["home_goals"] or !tipp["away_goals"]
      match = Match.find(tipp["match_id"])
      if DateTime.now > match.match_time
        @formerrors << "Für das Spiel #{match.home_team} - #{match.away_team} können keine Tipps mehr abgegeben werden."
        false
      end
      true
    end

    def create_ul 
      return if @formerrors.length == 0
      result = "<ul>"
      @formerrors.flatten().uniq.each do |msg|
        result += "<li>"
        result += msg
        result += "</li>"
      end
      result += "</ul>"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_tipp
      matchday = params[:id].to_i
      lastmatch = matchday * 9
      firstmatch = lastmatch - 8
      @tipps = Tipp.where("match_id < ? AND match_id > ?", lastmatch, firstmatch)

      @matches = Match.where(["matchday = ?", params[:id]])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipp_params
      params.require(:tipps).map do |p|
        p.permit(:home_goals, :away_goals, :user_id, :match_id, :points)
      end
      
    end
end
