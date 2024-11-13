class HistoriesController < ApplicationController
  def index
  end

  def new 
    @history_shipping = HisstoryShipping.new
  end

  def create
    @history_shipping = HisstoryShipping.new(hisstory_params)
  end

  private

  def hisstory_params
    params.require(:hisstory_shipping).permit(:postal_code, :address, :phone_num, :prefecture_id, :building_name, :house_num).merge(:user_id,current_user.id)

  end
