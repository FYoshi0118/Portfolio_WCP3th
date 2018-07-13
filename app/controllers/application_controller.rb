class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def post_owner?
    unless @post.user == current_user
    redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end

end
