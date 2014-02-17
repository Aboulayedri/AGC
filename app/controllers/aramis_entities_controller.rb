class AramisEntitiesController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_aramis_entity, only: [:show, :edit, :update, :destroy]

  # GET /aramis_entities
  # GET /aramis_entities.json
  def index
    @aramis_entities = AramisEntity.all
  end

  # GET /aramis_entities/1
  # GET /aramis_entities/1.json
  def show
    @collaborateurs = @aramis_entity.collaborators
  end

  # GET /aramis_entities/new
  def new
    @aramis_entity = AramisEntity.new
  end

  # GET /aramis_entities/1/edit
  def edit
  end

  # POST /aramis_entities
  # POST /aramis_entities.json
  def create
    @aramis_entity = AramisEntity.new(aramis_entity_params)
    authorize! :create, @aramis_entity

    respond_to do |format|
      if @aramis_entity.save
        format.html { redirect_to @aramis_entity.project_code, notice: "L'Entité Aramis #{@aramis_entity.name} a été créée avec succès" }
        format.json { render action: 'show', status: :created, location: @aramis_entity }
      else
        format.html { render action: 'new' }
        format.json { render json: @aramis_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aramis_entities/1
  # PATCH/PUT /aramis_entities/1.json
  def update
    respond_to do |format|
      if @aramis_entity.update(aramis_entity_params)
        format.html { redirect_to @aramis_entity, notice: "L'Entité Aramis #{@aramis_entity.name} a été modifiée avec succès" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aramis_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aramis_entities/1
  # DELETE /aramis_entities/1.json
  def destroy
    if @aramis_entity.collaborators.empty?
      @aramis_entity.destroy
      respond_to do |format|
        format.html { redirect_to @aramis_entity.project_code, notice: "L'Entité Aramis #{@aramis_entity.name} a été supprimée avec succès"}
        format.json { head :no_content }
      end
    else
      redirect_to :back, alert: "L'Entité Aramis #{@aramis_entity.name} n'a pas été supprimée car elle dispose de Collaborateurs"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aramis_entity
      @aramis_entity = AramisEntity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aramis_entity_params
      params.require(:aramis_entity).permit(:name, :description, :project_code_id)
    end
end
