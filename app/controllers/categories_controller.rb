class CategoriesController < ApplicationController

  def index
  end

  def show
    @items = Item.includes(:item_images).order('created_at DESC').limit(4)
    # @items = Item.including.where(category_id: @category.subtree_ids)
    # @items = @category..order("created_at DESC").all
    # カテゴリーidを元に,クリックされたカテゴリーのレコードを取得
    @category = Category.find(params[:id])
    # ↓詳細カテゴリページのリンク用
    # 一階層下のカテゴリーがある場合はそれを格納
    if @category.has_children?
      @category_links = @category.children
    # 無い場合は同じ階層のカテゴリーを格納
    else
      @category_links = @category.siblings
     end
  end

  

end
