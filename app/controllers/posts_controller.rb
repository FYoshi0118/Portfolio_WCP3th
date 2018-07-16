class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_post_user?, except: [:index, :new, :create] # application_controller
  before_action :check_login

  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @post = Post.new
    # @post.sake.build
    # @post.sake.brewery.build
  end

  def create
    # @post = current_user.posts.new(post_params)
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    binding.pry
    @post.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :image_id, :star)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
