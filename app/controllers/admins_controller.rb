class AdminsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_admin, only: [:edit, :update, :edit_password, :update_status]

  def top
  end

  def index
    @search = Admin.ransack(params[:q])
		@admins = @search.result.page(params[:page])
  end

  def edit
    redirect_to admins_path unless current_admin.is_main_administer == true
  end

  def edit_password
    if @admin.id != current_admin.id && current_admin.is_main_administer == false
      redirect_to edit_admin_path(@admin)
    end
  end

  def update
    if @admin.update(admin_params)
      sign_in(current_admin, :bypass => true)
      redirect_to edit_admin_path(@admin.id), notice: "#{@admin.family_name} #{@admin.given_name}の登録情報を変更しました"
    else
      render :edit
    end
  end

  def update_status
    if current_admin.is_main_administer == false
      redirect_to admin_top_path
    else
      if @admin.is_deleted == false
        @admin.update_attribute(:is_deleted, true)
        redirect_to admins_path
        flash[:notice] = "管理者 #{@admin.family_name} #{@admin.given_name}のアカウントを停止しました"
      elsif @admin.is_deleted == true
        @admin.update_attribute(:is_deleted, false)
        redirect_to admins_path
        flash[:notice] = "管理者 #{@admin.family_name} #{@admin.given_name}のアカウントを復旧しました"
      end
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:family_name, :given_name, :email, :password, :is_main_administer, :is_deleted)
  end

end
