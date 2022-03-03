class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @area = params[:area]
    if @area.present?
      @posts = Post.all.where(area: @area)
    else
      @posts = Post.all
    end

  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: '投稿しました'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path, alert: '他人のアカウントです'
    end

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '更新しました'
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :area)
  end
end
