class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end
  
  def new
    if user_signed_in?
      @item = Item.new
      @item.item_images.new
    else
      redirect_to user_session_path  
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品しました"
    else 
      redirect_to new_item_path, alert: "出品できません。入力必須項目を確認してください"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :user_id, 
      :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, 
      :brand, item_images_attributes: [:image])
      #:category_id,:buyer_id, :seller_id,
  end
end