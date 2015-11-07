class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.paginate(:page => params[:page], :per_page => 12).order('created_at DESC')
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @comments = Comment.where(photo_id: @photo).order('created_at DESC')
    calculate_rating @photo
    @comment =Comment.new
  end

  def calculate_rating(photo)
    comments = Comment.where(photo_id: photo)

    @rating = comments.average(:rating) # => 35.8
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to show_user_path(current_user)
      flash[:success] = 'Successfully created a new photo'
    else
      flash[:danger] = 'Oops! Something is wrong!'
      render 'new'
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy

    redirect_to show_user_path(current_user)
    flash[:info] = 'Photo was removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image)
    end
end
