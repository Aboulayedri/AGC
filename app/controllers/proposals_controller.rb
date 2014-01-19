class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy, :reserver, :arriver, :liberer, :valider]

  # GET /proposals
  # GET /proposals.json
  def index
    #@proposals = Proposal.where(date: Time.now.next_week.all_week)
    @propositions = Proposal.a_traiter
    @entites      = Entity.all
  end
  
  # GET /affectations
  def gestion_affectations
    @propositions_disponibles   = Proposal.a_traiter.disponibles
    @propositions_reservees     = Proposal.a_traiter.reservees

    @propositions_sortantes     = []
    propositions_presentes = Proposal.where(etat: "arrivée", date: Time.now.all_week)
    propositions_presentes.each do |proposition|
      @propositions_sortantes << proposition unless Proposal.where(consultant_id: proposition.consultant_id, date: Time.now.next_week.all_week).any?
    end
  end  
  
  # GET /confirmations
  def confirmation_affectations
    @propositions_validees = Proposal.a_traiter.validees
    @propositions_arrivees = Proposal.a_traiter.arrivees
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    #@request = @proposal.requests.new date: @proposal.date, etat: "en attente"
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to :back, notice: 'Proposal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @proposal }
      else
        format.html { render action: 'new' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'La proposition a été modifiée.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /proposals/1/reserver
  def reserver
    respond_to do |format|
      if @proposal.reserver
        format.html { redirect_to :back, notice: 'La proposition a été reservée.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Impossible de reserver cette proposition.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /proposals/1/valider
  def valider
    respond_to do |format|
      if @proposal.valider
        format.html { redirect_to :back, notice: 'La réservation du consultant a été validée.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Impossible de valider la réservation du consultant.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

   # GET /proposals/1/arriver
  def arriver
    respond_to do |format|
      if @proposal.arriver
        format.html { redirect_to :back, notice: 'La venue du consultant a été confirmée.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Impossible de confirmer la venue du consultant.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

   # GET /proposals/1/liberer
  def liberer
    respond_to do |format|
      if @proposal.liberer
        format.html { redirect_to :back, notice: 'Le consultant est de nouveau disponible.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Impossible de rendre disponible le consultant.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:consultant_id, :date, :nbre_jour, :etat, :project_id, :entity_id)
    end
end
