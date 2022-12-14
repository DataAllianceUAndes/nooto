class ClassnotesController < ApplicationController
  before_action :set_classnote, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /classnotes or /classnotes.json
  def index
    @q = Classnote.ransack(params[:q])
    @classnotes = @q.result
    @pagy, @classnotes = pagy(@classnotes)
  end

  # GET /classnotes/1 or /classnotes/1.json
  def show
    @classnote = Classnote.find(params[:id])
    @user = User.find(@classnote.user_id)
    if @classnote.reviews.blank?
      @average_review = 0
    else
      @average_review = @classnote.reviews.average(:rating)
    end
  end

  # GET /classnotes/new
  def new
    @classnote = Classnote.new
  end

  # GET /classnotes/1/edit
  def edit
  end

  # POST /classnotes or /classnotes.json
  def create
    @classnote = Classnote.new(classnote_params)
    @classnote.user_id = current_user.id
    @classnote.course_id = classnote_params[:course_id]

    respond_to do |format|
      if @classnote.save
        format.html { redirect_to classnote_url(@classnote), notice: "Classnote was successfully created." }
        format.json { render :show, status: :created, location: @classnote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classnotes/1 or /classnotes/1.json
  def update
    respond_to do |format|
      if @classnote.update(classnote_params)
        format.html { redirect_to classnote_url(@classnote), notice: "Classnote was successfully updated." }
        format.json { render :show, status: :ok, location: @classnote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classnotes/1 or /classnotes/1.json
  def destroy
    @classnote.destroy

    respond_to do |format|
      format.html { redirect_to classnotes_url, notice: "Classnote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_classnote
    @classnote = Classnote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def classnote_params
    params.require(:classnote).permit(:title, :user_id, :course_id, files: [])
  end
end
