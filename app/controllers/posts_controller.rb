class PostsController < ApplicationController
  before_action :set_post, :only => [ :show, :edit, :update, :destroy]

  def landing

  end

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to posts_path
  end

  def show
  end

protected
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit( :title, :trip_date, :origin, :destination, :distance, :description)
  end
end
