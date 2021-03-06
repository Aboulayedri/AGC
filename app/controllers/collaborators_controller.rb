class CollaboratorsController < ApplicationController
  load_and_authorize_resource except: [:create]

  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  # GET /collaborators
  # GET /collaborators.json
  def index
    @collaborators = Collaborator.accessible_by(current_ability)
    @entities = Entity.accessible_by(current_ability)
  end

  # GET /collaborators/1
  # GET /collaborators/1.json
  def show
    @propositions = Proposal.where(consultant_id: @collaborator.id)
  end

  # GET /collaborators/new
  def new
    @collaborator = Collaborator.new
  end

  # GET /collaborators/1/edit
  def edit
  end

  # POST /collaborators
  # POST /collaborators.json
  def create
    @collaborator = Collaborator.new(collaborator_params)
    authorize! :create, @collaborator

    respond_to do |format|
      if @collaborator.save
        if @collaborator.role == "consultant"
          format.html { redirect_to creer_propositions_entity_path(@collaborator.entity), notice: "Le Collaborateur #{@collaborator.name} a été créé avec succès." }
          # format.json { render action: 'show', status: :created, location: @collaborator }
        else
          format.html { redirect_to collaborators_path, notice: "Le Collaborateur #{@collaborator.name} a été créé avec succès." }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collaborators/1
  # PATCH/PUT /collaborators/1.json
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to :back, notice: "Le Collaborateur #{@collaborator.name} a été modifié avec succès." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @collaborator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborators/1
  # DELETE /collaborators/1.json
  def destroy
    @collaborator.destroy
    respond_to do |format|
      format.html { redirect_to collaborators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collaborator_params
      params.require(:collaborator).permit(:prenom, :nom, :id_karma, :role, :email, :etat, :statut, :niv_diplome, :nat_diplome, :entity_id, :manager_id, :commentaire, :profil, :eligibilite, :aramis_entity_id, :password)
    end
end
