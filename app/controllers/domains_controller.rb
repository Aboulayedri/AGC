class DomainsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_domain, only: [:show, :edit, :update, :destroy]

  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.accessible_by(current_ability)
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @project = @domain.projects.new
    @consultants_presents = []
    propositions_presentes = Proposal.where(etat: "arrivée", date: Time.now.all_week)
    propositions_presentes.each do |proposition|
      @consultants_presents << proposition.consultant
    end
  end

  # GET /domains/new
  def new
    @domain = Domain.new
  end

  # GET /domains/1/edit
  def edit
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(domain_params)
    authorize! :create, @domain

    respond_to do |format|
      if @domain.save
        format.html { redirect_to @domain, notice: "Le Domaine #{@domain.name} a été créé avec succès." }
        format.json { render action: 'show', status: :created, location: @domain }
      else
        format.html { render action: 'new' }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to @domain, notice: "Le Domaine #{@domain.name} a été modifié avec succès." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    if @domain.projects.empty?
      @domain.destroy
      respond_to do |format|
        format.html { redirect_to domains_url, notice: "Le domaine #{@domain.name} a été supprimé avec succès" }
        format.json { head :no_content }
      end
    else
      redirect_to :back, alert: "Le domaine #{@domain.name} n'a pas été supprimé car il dispose de projets"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(:name, :description, :responsable_id)
    end
end
