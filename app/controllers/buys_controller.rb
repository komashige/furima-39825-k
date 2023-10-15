class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    # 出品者が入れないようにするため。
    if @item.user_id == current_user.id || @item.buy.present?
      redirect_to root_path
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_form = BuyForm.new
  end

  def new
    @buy_form = BuyForm.new
  end

  def create
    
    @buy_form = BuyForm.new(buy_form_params)
    if @buy_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        currency: 'jpy',
        card: buy_form_params[:token],      
      ) 
      @buy_form.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end

  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_form_params
    params.require(:buy_form).permit(:post_code, :ship_area_id, :city, :street_address, :telephone_number, :building_name).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end