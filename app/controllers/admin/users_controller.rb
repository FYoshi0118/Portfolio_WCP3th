class Admin::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def index
    @search = User.ransack(params[:q])
    @users = @search.result.page(params[:page])
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:status)
  end

end
