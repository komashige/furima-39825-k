class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end

  def new
    @furima = Furima.new
  end

  def create
    Furima.create(furima_params)
    redirect_to '/'
  end

  private
  def furima_params
    params.require(:furima).permit(:name, :category_id, :condition_id, :description, :user, :ship_cost_id, :ship_area_id, :ship_day_id, :price)
  end

end

 