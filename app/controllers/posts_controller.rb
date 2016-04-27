class PostsController < ApplicationController
  before_action :find_post, :only => [ :show, :edit, :update, :destroy]

  def landing

  end

  def index

  end

  def new
    @post = Post.new
    # @photo = Photo.new
    @photo = @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    # @photo = Photo.new(photo_params)
    @photo =@post.photos.build(photo_params)
    @post.save
    @photo.save

    redirect_to posts_path
  end

  def show
  end

private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit( :title, :trip_date, :origin, :destination, :distance, :description)
  end
  def photo_params
    params.require(:post).permit( :post_id, :photo_location, :pic)
  end
end
