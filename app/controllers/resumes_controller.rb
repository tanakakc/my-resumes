class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = current_user.resumes
  end

  # GET /resumes/1
  # GET /resumes/1.json
  # GET /resumes/1.pdf
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "履歴書_#{@resume.company_name}",   # Excluding ".pdf" extension.
               encoding: "utf-8",
               show_as_html: params.key?('debug')
      end
    end
  end

  # GET /resumes/new
  def new
    @resume = current_user.resumes.build
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = current_user.resumes.build(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to root_path, notice: '履歴書を作成しました。' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to root_path, notice: '履歴書を更新しました。' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: '履歴書を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = current_user.resumes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:user_id, :company_name, :entry_reason, :summary, :request)
    end
end
