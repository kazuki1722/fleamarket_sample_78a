class ItemsController < ApplicationController
  def index
    @items = Items.includes(:item_images).order('created_at DESC')
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