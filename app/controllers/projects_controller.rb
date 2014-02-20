require "prawn"
class ProjectsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf { render pdf: generate_pdf(@project) }
    end
  end

  def generate_pdf(project)
    Prawn::Document.new do
      text project.name, align: :center
      text "Chef: #{project.chef.name}"
      text "Maitre d'ouvrage: #{project.maitrise_ouvrage.name}"
      text "Description: #{project.description}"
    end.render
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    authorize! :create, @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project.domain, notice: 'Le Projet ' + @project.name + ' a été créé avec succès.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Le Projet ' + @project.name + ' a été mis à jour.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :domain_id, :chef_id, :maitrise_ouvrage_id, :description, :code, :etat)
    end
end
