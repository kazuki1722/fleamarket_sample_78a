class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :category_parent_array, only: [:new, :create, :edit, :update]
  before_action :set_items, only: [:edit, :update, :destroy, :show]



  def index
    @items = Item.includes(:item_images).order('created_at DESC').limit(4)
    
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if item_params[:category_id] == ""
      
      render :new
    else
      if @item.save
        redirect_to root_path
      else 
        render :new
      end
    end
  end

  def show
    @images = @item.item_images
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else 
      render :edit
    end
  end

  def destroy
    redirect_to edit_item_path notice: "削除に失敗しました" unless @item.destroy
  end

  def search
    @keyword = params[:keyword]
    @items = Item.search(params[:keyword])
    @q = Item.ransack(params[:q])
  end

  def ransack
    @q = Item.ransack(params[:q])
    @ransack = @q.result(distinct: true)
    if params[:q].present?
      @namekey = params[:q][:name_cont]
    else
      params[:q] = {sorts: 'id asc'}
    end
  end


  # 子カテゴリー
  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end
  # 孫カテゴリー
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  private

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil) 
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id,
      :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, 
      :brand, :buyer_id, :seller_id, item_images_attributes: [:image,:_destroy, :id]).merge(seller_id: current_user.id, user_id: current_user.id)
  end
end