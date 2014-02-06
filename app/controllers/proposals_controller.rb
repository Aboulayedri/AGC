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
    @propositions_validees = Proposal.a_traiter.validees
    @propositions_reservees     = Proposal.a_traiter.reservees

    @propositions_disponibles       = []
    @propositions_non_eligibles     = []
    propositions = Proposal.where(etat: "disponible", date: Time.now.next_week.all_week)
    propositions.each do |proposition|
      if proposition.consultant.eligibilite == "éligible"
        @propositions_disponibles << proposition
      else
        @propositions_non_eligibles << proposition
      end
    end

    @propositions_sortantes     = []
    propositions_presentes = Proposal.where(etat: "arrivée", date: Time.now.all_week)
    propositions_presentes.each do |proposition|
      @propositions_sortantes << proposition unless Proposal.where(consultant_id: proposition.consultant_id, date: Time.now.next_week.all_week).any?
    end
  end  
  
  # GET /confirmations
  def confirmation_affectations
    @propositions_arrivees = Proposal.where(etat: "arrivée", date: Time.now.all_week)
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
        format.html { redirect_to creer_propositions_entity_path(@proposal.entity), notice: 'La proposition a été créée avec succès.' }
        format.json { render action: 'show', status: :created, location: @proposal }
      else
        format.html { render action: 'new' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # Publication des propostions après la validation des profils des consultants
  # GET /proposals/publier
  def publier
    @profils_non_valides     = []
    propositions_encours = Proposal.a_traiter
    propositions_encours.each do |proposition|
      @profils_non_valides << proposition.consultant unless proposition.consultant.profil_valide?
    end
    
   if @profils_non_valides.empty?
     propositions_encours.each do |proposition|
       proposition.publier
       proposition.reconduire unless !proposition.present?
     end
     redirect_to :back, notice: "Les propositions ont été publiées"
   else
     redirect_to :back, alert: "La publication n'est pas permise car il y a des profils non-validés"
   end
  end  

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to :back, notice: 'La proposition a été modifiée.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # Envoie des codes d'imputation des consultant présents pour la semaine encours
  # GET /proposals/envoyer_codes
  def envoyer_codes
    propositions_arrivees = Proposal.where(etat: "arrivée", date: Time.now.all_week)
    # pour chaque proposition arrivée, on envoie le code d'imputation 
    propositions_arrivees.each do |proposition_arrivee|
      CollaboratorMailer.envoyer_codes_imputation(proposition_arrivee).deliver
    end
    redirect_to :back, notice: "Les codes d'imputation ont été envoyés aux consultants présents"
  end

  # PATCH /proposals/1/reserver
  def reserver
    respond_to do |format|
      if proposal_params[:project_id].to_s.empty?
        format.html { redirect_to :back, alert: "Réservation refusée car projet absent"}
      else
        if @proposal.update(proposal_params)
          format.html { redirect_to :back, notice: 'La proposition a été reservée.' }
          format.json { head :no_content }
        else
          format.html { redirect_to :back, notice: 'Impossible de reserver cette proposition.' }
          format.json { render json: @proposal.errors, status: :unprocessable_entity }
        end
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
