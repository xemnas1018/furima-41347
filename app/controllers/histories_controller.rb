class HistoriesController < ApplicationController
  before_action :set_item, only:[:index, :create] 

  def index

    @history_shipping = HistoryShipping.new
  end


  def create
    @history_shipping = HistoryShipping.new(history_params)
    #binding.pry
    if @history_shipping.valid?
      @history_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def history_params
    params.require(:history_shipping).permit(:postal_code, :address, :phone_num, :prefecture_id, :building_name, :house_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

