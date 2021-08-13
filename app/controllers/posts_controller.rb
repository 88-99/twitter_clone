class PostsController < ApplicationController
  def index
  end
  def new
    @post = Post.new
  end
  def create
    Post.create(params.require(:post).permit(:title, :content))
    redirect_to new_post_path
  end
  private
  def post_params
    params.require(:blog).permit( :content)
  end
end
