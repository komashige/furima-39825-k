class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end

  def new
    @furima = Furima.new
  end

end

 