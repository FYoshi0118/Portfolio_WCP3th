class PostsController < ApplicationController
  skip_before_action :authenticate_admin!
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
    # @brewery = Brewery.new(brewery_params)
    # if @brewery = Brewery.find_by(name: brewery_params[:name])
    #   binding.pry
    #   return @brewery
    # else
    #   @brewery = Brewery.new(brewery)
    #   render :new unless @brewery.save
    # end
    binding.pry
    @brewery = Brewery.find_or_create_by(name: brewery_params[:name])

    unless @sake = Sake.find_by(brand: sake_params[:sakes_attributes][:"0"][:brand])
      @sake = Sake.new(sake_params[:sakes_attributes][:"0"])
      @sake.brewery_id = @brewery.id
      @sake.save
    end
    binding.pry
    @post = Post.new(post_params[:sakes_attributes][:"0"][:posts_attributes][:"0"])
    @post.sake_id = @sake.id
    @post.save
    
    redirect_to posts_path, notice: "投稿しました。"
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name)
  end

  def sake_params
    params.require(:brewery).permit(sakes_attributes: [:brand, :specially_designated,
                                                       :recipe, :flavor, :nihonshudo, :acidity
                                                       ])
  end

  def post_params
    params.require(:brewery).permit(sakes_attributes: [posts_attributes: [:user_id, :content, :image, :star]])
  end

  # def all_params
  #   params.require(:brewery).permit(:name,
  #                                   sakes_attributes: [:brand, :specially_designated,
  #                                                     :recipe, :flavor, :nihonshudo, :acidity,
  #                                                     posts_attributes: [:user_id, :content, :image, :star
  #                                   ]])
  # end

end
