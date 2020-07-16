class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @items = Item.includes(:item_images).order('created_at DESC').limit(4)
    
  end

  def new
      @item = Item.new
      @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id,
      :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, 
      :brand, :buyer_id, :seller_id, item_images_attributes: [:image]).merge(seller_id: current_user.id, user_id: current_user.id)
  end
end

def foge
end