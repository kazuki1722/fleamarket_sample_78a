class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end
  
  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品しました"
    else 
      redirect_to new_item_path, alert: "出品できません。入力必須項目を確認してください"
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :price, :shipping_charges, :shipping_from, :shipping_days, :user_id, item_images_attributes: [:image])
  end
end