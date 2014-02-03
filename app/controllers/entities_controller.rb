class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy, :creer_propositions]

  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1/creer_propositions
  # GET /entities/1/creer_propositions.json
  def creer_propositions
    @propositions = Proposal.where(entity_id: @entity.id, date: Time.now.next_week.all_week)
    #@consultants  = Collaborator.where(entity_id: @entity.id, role: "consultant", Proposal.where(conultant_id: id, date: Time.now.next_week.all_week).empty?)
    
    @consultants_a_proposer = []
    consultants             = Collaborator.where(entity_id: @entity.id, role: "consultant")
    consultants.each do |consultant|
      @consultants_a_proposer << consultant unless Proposal.where(consultant_id: consultant.id, date: Time.now.next_week.all_week).any?
    end
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
    @propositions = Proposal.where(entity_id: @entity.id, date: Time.now.all_week)
    #@list = @entity.lists.new
    @collaborateurs = @entity.collaborators
    @collaborator = @entity.collaborators.new
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, notice: "L\'Entité #{@entity.name} a été créée avec succès." }
        format.json { render action: 'show', status: :created, location: @entity }
      else
        format.html { render action: 'new' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: "L'Entité #{@entity.name} a été modifiée avec succès." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:name, :description, :manager_id)
    end
end
