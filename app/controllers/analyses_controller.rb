class AnalysesController < ApplicationController
  skip_before_action :authenticate_admin!
  before_action :ensure_correct_post_user?, except: [:index, :new, :create] # application_controller
  before_action :check_login

  def index
    @posts = Post.where(user_id: current_user.id)
    @evaluations = Post.joins(sake: :brewery).select('address_prefecture, AVG(star) AS avg_star').group(:address_prefecture).where(user_id: current_user.id)
  end
end