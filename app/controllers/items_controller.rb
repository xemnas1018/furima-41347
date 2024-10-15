class ItemsController < ApplicationController
  # before_action :move_to_index, exsept: [:index]
  def index
  
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.create(item_params)
    redirect_to "/"
  end

  private

  def move_to_index
    return if user_signed_in?
    redirect_to action: :index
  end

  def item_params
    params.require(:item).permit(:image,:name,:item_comment,:category_id,:item_status_id,:shipping_fee_id,:prefecture_id,:shipping_time_id,:price).merge(user_id: current_user.id)
  end
end