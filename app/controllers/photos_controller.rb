class PhotosController < ApplicationController

  def index
    # first we figure out who we're following
    # and get their user ids
    ids_of_the_users_we_are_following = current_user.following.pluck(:id)

    # instead of fetching all photos with
    # @photos = Photo.order(created_at: :desc).page(params[:page]).per(3)

    # we add a where clause to only get the photos for the users we're following
    @photos = Photo
                .where(user_id: ids_of_the_users_we_are_following)
                .order(created_at: :desc)
                .page(params[:page])
                .per(3)

    @recommended_users = User.where.not(id: [current_user.id] + ids_of_the_users_we_are_following)
    
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to photos_url
    else
      render :action => "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_url
    else
      render :action => "edit"
    end
  end

  def destory
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_url
  end

  private
    def photo_params
      params.require(:photo).permit(:description, :image)
    end
end
