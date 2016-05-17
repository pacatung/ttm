class PostsController < ApplicationController
  before_action :find_post, :only => [ :show, :edit, :update, :destroy]

  def landing
    @posts = Post.limit(15)
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        if params[:pics]
          #===== post pics[] here
          params[:pics].each { |pic|
            @post.photos.create(pic: pic)
          }
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      end
    end
  end

  def show
    @photos = @post.photos
  end

private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit( :title, :trip_date, :origin, :destination, :distance, :description, photos_attributes: [:post_id, :photo_location, :pic])
  end
end
