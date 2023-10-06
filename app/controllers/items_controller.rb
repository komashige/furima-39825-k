class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user)
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save    
      redirect_to root_path
    else
      render :new,status: :unprocessable_entity
    end

  end

 

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :condition_id, :description, :ship_cost_id, :ship_area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end
end