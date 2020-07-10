class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC').limit(4)
    
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end