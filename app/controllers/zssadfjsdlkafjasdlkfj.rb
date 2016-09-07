# class ImageablesController < ApplicationController
#   def new
#     @post = Post.find(params[:post_id])
#     @imageable = @post.imageables.build

#     respond_to do |format|
#       format.html # new.html.erb
#     end
#   end

#   # GET /imageables/1/edit
#   def edit
#     @imageable = imageable.find(params[:id])
#   end

#   # POST /imageables
#   def create
#     @imageable = imageable.new(params[:imageable])

#     @imageable.save
#       respond_to do |format|
#         format.html {
#           render :json => [@imageable.to_jq_upload].to_json,
#           :content_type => 'text/html',
#           :layout => false
#         }
#       end
#   end
# private
#   def imageable_params
#     params.require(:imageable).permit(:post_id, :image_file_name,:image_content_type,:image_file_size,:image_updated_at)
#   end
# end
