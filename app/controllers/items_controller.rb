class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :update, :destroy]
  before_action :item_find_instance, only: [:edit, :update, :show, :destroy]
  before_action :matched_user_id, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end 

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_comment, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def matched_user_id
      return if current_user.id == @item.user_id

      redirect_to root_path
  end


  def item_find_instance
    @item = Item.find(params[:id])
  end
end
