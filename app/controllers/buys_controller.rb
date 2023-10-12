class BuysController < ApplicationController

  def index
    @buy_form = BuyForm.new
  end
end
