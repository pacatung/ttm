class PhotosController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @photo = @post.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    #@post = post.find(params[:post_id])

    @photo = Photo.find(params[:id])
    # @photo = photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
private
  def photo_params
    params.require(:photo).permit(:post_id, :photo_location, :pic_file_name,:pic_content_type,:pic_file_size,:pic_updated_at)
  end
end