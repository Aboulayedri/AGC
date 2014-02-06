class ProjectCodesController < ApplicationController
  before_action :set_project_code, only: [:show, :edit, :update, :destroy]

  # GET /project_codes
  # GET /project_codes.json
  def index
    @project_codes = ProjectCode.all
  end

  # GET /project_codes/1
  # GET /project_codes/1.json
  def show
  end

  # GET /project_codes/new
  def new
    @project_code = ProjectCode.new
  end

  # GET /project_codes/1/edit
  def edit
  end

  # POST /project_codes
  # POST /project_codes.json
  def create
    @project_code = ProjectCode.new(project_code_params)

    respond_to do |format|
      if @project_code.save
        format.html { redirect_to @project_code, notice: 'Project code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_codes/1
  # PATCH/PUT /project_codes/1.json
  def update
    respond_to do |format|
      if @project_code.update(project_code_params)
        format.html { redirect_to @project_code, notice: 'Project code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_codes/1
  # DELETE /project_codes/1.json
  def destroy
    @project_code.destroy
    respond_to do |format|
      format.html { redirect_to project_codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_code
      @project_code = ProjectCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_code_params
      params.require(:project_code).permit(:name)
    end
end
