class CreateUploadersController < ApplicationController
  before_action :set_create_uploader, only: %i[ show edit update destroy ]

  # GET /create_uploaders or /create_uploaders.json
  def index
    @create_uploaders = CreateUploader.all
  end

  # GET /create_uploaders/1 or /create_uploaders/1.json
  def show
  end

  # GET /create_uploaders/new
  def new
    @create_uploader = CreateUploader.new
  end

  # GET /create_uploaders/1/edit
  def edit
  end

  # POST /create_uploaders or /create_uploaders.json
  def create
    @create_uploader = CreateUploader.new(create_uploader_params)

    respond_to do |format|
      if @create_uploader.save
        format.html { redirect_to @create_uploader, notice: "Create uploader was successfully created." }
        format.json { render :show, status: :created, location: @create_uploader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_uploaders/1 or /create_uploaders/1.json
  def update
    respond_to do |format|
      if @create_uploader.update(create_uploader_params)
        format.html { redirect_to @create_uploader, notice: "Create uploader was successfully updated." }
        format.json { render :show, status: :ok, location: @create_uploader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_uploaders/1 or /create_uploaders/1.json
  def destroy
    @create_uploader.destroy!

    respond_to do |format|
      format.html { redirect_to create_uploaders_path, status: :see_other, notice: "Create uploader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_uploader
      @create_uploader = CreateUploader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_uploader_params
      params.require(:create_uploader).permit(:title, :image)
    end
end
