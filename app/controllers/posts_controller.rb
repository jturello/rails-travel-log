class PostsController < ApplicationController
  before_filter :load_commentable

  def new
    @commentable
    @post = Post.new
  end

  def create
    @post = @commentable.posts.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @post.save
          flash[:notice] = "Post successfully added!"
          redirect_to country_destination_path @commentable.country, @commentable
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

  def update

  end



  private

  def post_params
    params.require(:post).permit(:content)
  end

  def load_commentable
    path = request.path.split('/')
    posts_index = path.index('posts')
    resource, id = path[posts_index - 2], path[posts_index - 1]
    @commentable = resource.singularize.classify.constantize.find(id)

  end
end
