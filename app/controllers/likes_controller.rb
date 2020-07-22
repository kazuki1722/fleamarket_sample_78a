class LikesController < ApplicationController
  before_action :set_variables
  before_action :category_parent_array

  def like
    like = current_user.likes.new(item_id: @item.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
  end

  private
  def set_variables
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
  end

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil)
  end
end
