class MypagesController < ApplicationController

  before_action :category_parent_array

  def index
  end

  def logout
  end

  private
  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil) 
  end
end
