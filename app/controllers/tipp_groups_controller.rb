class TippGroupsController < ApplicationController
  before_action :set_tipp_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tipp_groups
  # GET /tipp_groups.json
  def index
    @tipp_groups = TippGroup.all
  end

  # GET /tipp_groups/1
  # GET /tipp_groups/1.json
  def show
  end

  # GET /tipp_groups/new
  def new
    @tipp_group = TippGroup.new
  end

  # GET /tipp_groups/1/edit
  def edit
  end

  # POST /tipp_groups
  # POST /tipp_groups.json
  def create
    @tipp_group = TippGroup.new(tipp_group_params)
    @tipp_group.user_id = current_user.id if current_user
    
    respond_to do |format|
      if @tipp_group.save
        format.html { redirect_to @tipp_group, notice: 'Tipp group was successfully created.' }
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
    respond_to do |format|
      if @tipp_group.update(tipp_group_params)
        format.html { redirect_to @tipp_group, notice: 'Tipp group was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipp_group }
      else
        format.html { render :edit }
        format.json { render json: @tipp_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipp_groups/1
  # DELETE /tipp_groups/1.json
  def destroy
    @tipp_group.destroy
    respond_to do |format|
      format.html { redirect_to tipp_groups_url, notice: 'Tipp group was successfully destroyed.' }
      format.json { head :no_content }
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
end
