class ReviewsController < ApplicationController
  before_action :get_classnote
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = @classnote.reviews
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @classnote.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = @classnote.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to classnote_reviews_path(@classnote), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to classnote_review_path(@classnote), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to classnote_reviews_path(@classnote ), notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Classnote declaration
    def get_classnote
      @classnote = Classnote.find(params[:classnote_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @classnote.reviews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
