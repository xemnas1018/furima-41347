class ItemsController < ApplicationController
  before_action :matched_user_id, only: [:edit, :update]
  before_action :move_to_session, only: [:new]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_comment, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def matched_user_id
    @item = Item.find(params[:id])
    if user_signed_in?
      return if current_user.id == @item.user_id

      redirect_to root_path

    else
      redirect_to new_user_session_path
    end
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
