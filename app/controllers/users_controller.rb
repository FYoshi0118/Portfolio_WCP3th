class UsersController < ApplicationController
  skip_before_action :authenticate_admin!
  before_action :ensure_correct_user?
  before_action :check_login, expect: [:unsubscribe]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :confirm, :unsubscribe]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "更新しました"
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  def destroy
  end

  def unsubscribe
    status = params[:user][:status].to_i
    if status == 1
      @user.update(status: params[:user][:status])
      redirect_to logout_path, notice: "退会処理が完了しました。ご利用ありがとうございました。"
    else
      redirect_to confirm_user_path(current_user)
      flash[:alert] = "チェックを入れて下さい。"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user?
    if current_user.id != params[:id].to_i
      flash[:alert] = "アクセス権限がありません"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name_code, :nickname, :birthday, :email, :introduction)
  end

end
