class CategoriesController < ApplicationController

  def index
    @category_parent_array = Category.where(ancestry: nil)
  end

  def show
  end

end
