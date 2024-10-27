class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :sign_up, :sign_in]
  before_action :authenticate_user!, only:[:new] 
  def index
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end

  def item_params
    params.require(:item).permit(:image, :name, :item_comment, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_time_id, :price).merge(user_id: current_user.id)
  end
end
