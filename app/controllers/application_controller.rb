class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :authenticate_admin!

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
  
  def check_login
    if user_signed_in?
      if current_user.status == 1
        redirect_to logout_path
        flash[:alert] = "退会処理を行ったためアクセス出来ません"
      elsif current_user.status == 2
        redirect_to logout_path
        flash[:alert] = "アクセス権限を停止しています"
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
