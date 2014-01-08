class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :accepter, :refuser, :confirmer]

  # GET /requests
  # GET /requests.json
  def index
    #@requests = Request.all
    @demandes_encours   = Request.a_traiter.encours
    @demandes_acceptees = Request.a_traiter.acceptees
    @demandes_refusees  = Request.a_traiter.refusees
    @demandes_confirmees  = Request.a_traiter.confirmees
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request.proposal, notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request.proposal, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /requests/1/accepter
  def accepter
    respond_to do |format|
      if @request.accepter
        format.html { redirect_to @request, notice: 'La demande a été acceptée.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @request, notice: 'Impossible d"accepter cette Demande.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /requests/1/refuser
  def refuser
    respond_to do |format|
      if @request.refuser
        format.html { redirect_to @request, notice: 'La demande a été refusée.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @request, notice: 'Impossible de refuser cette Demande.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /requests/1/confirmer
  def confirmer
    respond_to do |format|
      if @request.confirmer
        format.html { redirect_to @request, notice: 'La demande a été confirmée.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @request, notice: 'Impossible de confirmer cette Demande.' }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:project_id, :proposal_id, :date, :etat)
    end
end
