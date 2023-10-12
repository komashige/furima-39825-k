class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @ship = Ship.new
    @buy_form = BuyForm.new
  end

  def create
    @ship = Ship.new(ship_params)
    if @ship.valid?
      @buy_form = BuyForm.new(buy_form_params)
      if @buy_form.save
        return redirect_to root_path
      else
        render 'index', status: :unprocessable_entity
      end
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ship_params
    params.require(:ship).permit(:post_code, :ship_area_id, :city, :street_address, :telephone_number)
  end

  def buy_form_params
    params.require(:buy_form).permit(:item_id, :user_id).merge(user_id: current_user.id, item_id: @item.id)
  end
end