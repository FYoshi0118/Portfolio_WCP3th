class Admin::SakesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_sake, only: [:edit, :update, :destroy]

  def index
    @sakes = Sake.all
  end

  def new
    @brewery = Brewery.new
    @sake = @brewery.sakes.build
  end

  def create
    @brewery = Brewery.find_or_create_by(name: brewery_params[:name])

    unless @sake = Sake.find_by(brand: sake_params[:sakes_attributes][:"0"][:brand])
      @sake = Sake.new(sake_params[:sakes_attributes][:"0"])
      @sake.brewery_id = @brewery.id
    end
  end

  def edit
  end

  def update
    # 蔵元情報更新
    if brewery = Brewery.find_by(name: brewery_params[:name])
      # return brewery
    else
      brewery = Brewery.create(name: brewery_params[:name])
    end

    # 酒情報更新
    @sake.brewery_id = brewery.id
    @sake.update(sake_params)
    redirect_to edit_admin_sake_path(@sake.id), notice: "更新しました"
  end

  def destroy
    @sake.destroy
    redirect_to admin_sakes_path, notice: "削除しました"
  end

  private
  def set_sake
    @sake = Sake.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name)
  end

  def sake_params
    params.require(:brewery).permit(sakes_attributes: [:brand, :specially_designated,
                                                       :recipe, :flavor, :nihonshudo, :acidity
                                                       ])
  end

end
