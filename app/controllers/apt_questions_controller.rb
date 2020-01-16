class AptQuestionsController < ApplicationController
  before_action :set_apt_question, only: [:show, :edit, :update, :destroy]

  # GET /apt_questions
  # GET /apt_questions.json
  def index
    @apt_questions = AptQuestion.all
    respond_to do |format|
      format.csv { send_data AptQuestion.export_csv(@apt_questions) }
      format.html
    end
  end

  # GET /apt_questions/1
  # GET /apt_questions/1.json
  def show
  end

  # GET /apt_questions/new
  def new
    @apt_question = AptQuestion.new
  end

  # GET /apt_questions/1/edit
  def edit
  end

  # POST /apt_questions
  # POST /apt_questions.json
  def create
    @apt_question = AptQuestion.new(apt_question_params)

    respond_to do |format|
      if @apt_question.save
        format.html { redirect_to @apt_question, notice: 'Apt question was successfully created.' }
        format.json { render :show, status: :created, location: @apt_question }
      else
        format.html { render :new }
        format.json { render json: @apt_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apt_questions/1
  # PATCH/PUT /apt_questions/1.json
  def update
    respond_to do |format|
      if @apt_question.update(apt_question_params)
        format.html { redirect_to @apt_question, notice: 'Apt question was successfully updated.' }
        format.json { render :show, status: :ok, location: @apt_question }
      else
        format.html { render :edit }
        format.json { render json: @apt_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apt_questions/1
  # DELETE /apt_questions/1.json
  def destroy
    @apt_question.destroy
    respond_to do |format|
      format.html { redirect_to apt_questions_url, notice: 'Apt question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apt_question
      @apt_question = AptQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apt_question_params
      params.require(:apt_question).permit(:question, :answer, :category, :difficuly, :question_type, :is_public, :options)
    end
end
