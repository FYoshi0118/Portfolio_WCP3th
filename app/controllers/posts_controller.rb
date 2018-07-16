class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_post_user?, except: [:index, :new, :create] # application_controller
  before_action :check_login

  def index
    # @posts = Post.where(user_id: current_user.id)
    @user = User.find(params[:id])
  end

  def show
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)

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
