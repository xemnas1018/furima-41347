class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create] 
  before_action :mismatch_user,only: [:index, :create]
  before_action :sold_check, only: [:index]
  before_action :set_history_shipping, only:[:index] 

  def index
    #@history_shipping = HistoryShipping.new
  end


  def create
    @history_shipping = HistoryShipping.new(history_params)
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

  def set_history_shipping
    @history_shipping = HistoryShipping.new
  end
  
  def mismatch_user
    return unless current_user.id == @item.user_id
    redirect_to root_path
  end

  def sold_check
    @history = History.find(params[:item_id])
    return if  @history.item_id != @item.id
    redirect_to root_path
  end

end

