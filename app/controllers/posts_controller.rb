class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    Post.create(params.require(:post).permit(:title, :content))
    redirect_to new_post_path
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  private
  def post_params
    params.require(:post).permit( :content)
  end
end
