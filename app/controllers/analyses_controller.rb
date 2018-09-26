class AnalysesController < ApplicationController
  skip_before_action :authenticate_admin!
  before_action :set_post, only: [:index]
  before_action :ensure_correct_post_user?, except: [:index, :new, :create] # application_controller
  before_action :check_login

  def index
  end

  private

  def set_post
    @posts = Post.where(user_id: current_user.id)
  end

end
