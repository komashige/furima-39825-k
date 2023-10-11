class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order("created_at DESC")
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

  def show
    
  end  

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end 


  

  def update
   
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

 

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :condition_id, :description, :ship_cost_id, :ship_area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
