class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
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
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end
  def confirm
    @post = Post.new(post_params)
  end
  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit( :content)
  end
end
