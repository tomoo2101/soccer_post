class PostsController < ApplicationController
  def index
    @area = params[:area]
    if @area.present?
      @posts = Post.all.where(area: @area)
    else
      @posts = Post.all
    end

  end

  def show
    @post = Post.find(params["id"])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :area)
  end
end
