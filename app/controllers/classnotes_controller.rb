class ClassnotesController < ApplicationController
  before_action :set_classnote, only: %i[ show edit update destroy ]

  # GET /classnotes or /classnotes.json
  def index
    @classnotes = Classnote.all
  end

  # GET /classnotes/1 or /classnotes/1.json
  def show
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
      params.require(:classnote).permit(:title)
    end
end
