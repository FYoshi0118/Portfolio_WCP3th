class Admin::BreweriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_brewery, only: [:edit, :update]

  def index
    @search = Brewery.ransack(params[:q])
		@breweries = @search.result.page(params[:page]).reverse_order
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      redirect_to admin_breweries_path, notice: "#{@brewery.name}を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @brewery.update(brewery_params)
    redirect_to edit_admin_brewery_path(@brewery.id), notice: "#{@brewery.name}を更新しました"
  end

  private
  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name, :post_code, :address, :phone_number,
                                    :email, :url, :is_confirmed
                                    )
  end

end
