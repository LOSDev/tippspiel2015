class TippGroupsController < ApplicationController
  before_action :set_tipp_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tipp_groups
  # GET /tipp_groups.json
  def index
    @tipp_groups = TippGroup.ordered
    @founded_groups = current_user.tipp_groups
    @member_groups = GroupMember.includes(:tipp_group).where(user_id: current_user.id)
  end

  # GET /tipp_groups/1
  # GET /tipp_groups/1.json
  def show
    @isFounder = authorize
  end

  # GET /tipp_groups/new
  def new
    @tipp_group = TippGroup.new
  end

  # GET /tipp_groups/1/edit
  def edit
    redirect_to @tipp_group unless authorize
  end

  # POST /tipp_groups
  # POST /tipp_groups.json
  def create
    @tipp_group = TippGroup.new(tipp_group_params)
    @tipp_group.user_id = current_user.id if current_user
    
    respond_to do |format|
      if @tipp_group.save
        format.html { redirect_to @tipp_group, notice: 'Tipp-Gruppe wurde erstellt!' }
        format.json { render :show, status: :created, location: @tipp_group }
      else
        format.html { render :new }
        format.json { render json: @tipp_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipp_groups/1
  # PATCH/PUT /tipp_groups/1.json
  def update
    if authorize
      respond_to do |format|
        if @tipp_group.update(tipp_group_params)
          format.html { redirect_to @tipp_group, notice: 'Tipp group was successfully updated.' }
          format.json { render :show, status: :ok, location: @tipp_group }
        else
          format.html { render :edit }
          format.json { render json: @tipp_group.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @tipp_group
    end
  end

  # DELETE /tipp_groups/1
  # DELETE /tipp_groups/1.json
  def destroy
    if authorize
      @tipp_group.destroy 
      respond_to do |format|
        format.html { redirect_to tipp_groups_url, notice: 'Tipp-Gruppe wurde erfolgreich zerstört.' }
        format.json { head :no_content }
      end
    else
      redirect_to @tipp_group
    end
  end

  def create_member
    password = params[:password]
    id = params[:id]
    tipp_group = TippGroup.find(id)
    redirect_to tipp_group_path(id), notice: "Sie können nicht ihrer eigenen Gruppe beitreten." if current_user.id == tipp_group.user_id

    if tipp_group.password == password
      p new_member = GroupMember.new(user_id: current_user.id, tipp_group_id: id)
      if new_member.save
        redirect_to tipp_group_path(id), notice: "Sie wurden der Gruppe \"#{tipp_group.name}\" hinzugefügt."
      else
        redirect_to tipp_group_path(id), notice: "Sie gehören schon zur Gruppe \"#{tipp_group.name}\"."
      end
    else
      redirect_to tipp_group_path(id), notice: "Gruppenpasswort war nicht korrekt."
    end
  end

  def delete_member
    tipp_group_id = params[:id]
    tipp_group = TippGroup.find(tipp_group_id)
    user_id = params[:user]
    user = User.find(user_id)

    if current_user.id == tipp_group.user_id
      gm = GroupMember.where(user_id: user, tipp_group_id: tipp_group_id)
      GroupMember.destroy(gm)
      redirect_to tipp_group_path(tipp_group_id), notice: "Mitglied #{user.username} wurde aus der Gruppe \"#{tipp_group.name}\" entfernt."
    else
      redirect_to tipp_group_path(tipp_group_id), notice: "Sie haben keine Berechtigung Mitglieder aus dieser Gruppe zu entfernen."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipp_group
      @tipp_group = TippGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipp_group_params
      params.require(:tipp_group).permit(:user_id, :password, :name)
    end

    def authorize
      return false if current_user.id != @tipp_group.user_id
      true
    end
end
