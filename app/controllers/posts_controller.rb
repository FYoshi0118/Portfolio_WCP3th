class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_owner?, except: [:index, :new, :create] # application_controller

  def index
  end

  def show
  end

  def new
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
