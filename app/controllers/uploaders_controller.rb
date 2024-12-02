class UploadersController < ApplicationController
  before_action :set_uploader, only: %i[ show edit update destroy ]

  # GET /uploaders or /uploaders.json
  def index
    @uploaders = Uploader.all
  end

  # GET /uploaders/1 or /uploaders/1.json
  def show
  end

  # GET /uploaders/new
  def new
    @uploader = Uploader.new
  end

  # GET /uploaders/1/edit
  def edit
  end

  # POST /uploaders or /uploaders.json
  def create
    @uploader = Uploader.new(uploader_params)
    @uploader.image.attach(uploader_params[:image]) if uploader_params[:image].present?
    respond_to do |format|
      if @uploader.save
        format.html { redirect_to @uploader, notice: "Uploader was successfully created." }
        format.json { render :show, status: :created, location: @uploader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploaders/1 or /uploaders/1.json
  def update
    respond_to do |format|
      @uploader.image.attach(uploader_params[:image]) if uploader_params[:image].present?
      if @uploader.update(uploader_params)
        format.html { redirect_to @uploader, notice: "Uploader was successfully updated." }
        format.json { render :show, status: :ok, location: @uploader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploaders/1 or /uploaders/1.json
  def destroy
    @uploader.destroy!

    respond_to do |format|
      format.html { redirect_to uploaders_path, status: :see_other, notice: "Uploader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uploader
      @uploader = Uploader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uploader_params
      params.require(:uploader).permit(:title, :image)
    end
end
