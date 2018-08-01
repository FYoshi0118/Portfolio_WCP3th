class Admin::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_post, only: [:show]

  def index
    @search = Post.ransack(params[:q])
		@posts = @search.result.page(params[:page]).reverse_order
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
