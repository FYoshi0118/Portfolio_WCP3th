class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_top_path
    else
      posts_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def ensure_correct_post_user?
    unless @post.user == current_user
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name_code, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name_code, :email])
  end

end
