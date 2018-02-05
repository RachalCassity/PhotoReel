
class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    @comment.user = current_user
     if @comment.save
      redirect_to photos_url
     else
      render :action => "new"
     end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to photos_url
  end

  def show
    @commment = Comment.find params[:id]
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
