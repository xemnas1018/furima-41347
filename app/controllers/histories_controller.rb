class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create] 
  before_action :mismatch_user,only: [:index, :create]
  before_action :sold_check, only: [:index]

  def index
    gon.public_key =  ENV["PAYJP_PUBLIC_KEY"]
    @history_shipping = HistoryShipping.new
  end


  def create
    @history_shipping = HistoryShipping.new(history_params)
    if @history_shipping.valid?
      pay_item
      @history_shipping.save
      redirect_to root_path
    else
      gon.public_key =  ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def history_params
    params.require(:history_shipping).permit(:postal_code, :address, :phone_num, :prefecture_id, :building_name, :house_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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
    if @item.history.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency:"jpy"
    )
  end


end

