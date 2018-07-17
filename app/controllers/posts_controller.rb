class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_post_user?, except: [:index, :new, :create] # application_controller
  before_action :check_login

  def index
    # @posts = Post.where(user_id: current_user.id)
    @user = User.find(current_user.id)
  end

  def show
  end

  def new
    @brewery = Brewery.new
    @sake = @brewery.sakes.build
    @post = @sake.posts.build
  end

  def create
    @brewery = Brewery.new(post_params)
    binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:brewery).permit(:name,
                                    sakes_attributes: [:brand, :specially_designated,
                                                               :recipe, :flavor, :nihonshudo, :acidity,
                                                       posts_attributes: [:user_id, :content, :image, :star
                                    ]])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
