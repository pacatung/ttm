class PostsController < ApplicationController

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

protected
  def post_params
    params.require(:post).permit( :title, :trip_date, :origin, :destination, :distance, :description)
  end
end
