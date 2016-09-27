class PostsController < ApplicationController

  def new
    @destination = Destination.find(params[:destination_id])
    @post = Post.new
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @post = @destination.posts.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @post.save
          flash[:notice] = "Post successfully added!"
          redirect_to country_destination_path @destination.country, @destination
        else
          flash[:alert] = "Post not added. Try again!"
          render :new
        end
      end
      format.js do
        @post.save()
      end
    end

  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
