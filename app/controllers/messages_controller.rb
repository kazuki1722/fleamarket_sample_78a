class MessagesController < ApplicationController

  before_action :set_message, only: [:update,:destroy,:restore]

  def create
    @message = Message.new(message_params)
    @seller_of_item = User.find(@message.item.seller_id)
    @item = @message.item.id
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to redirect_to item_path(@item.id)
    end
  end

  def update
    unless @message.update(delete_check:1)
      redirect_to redirect_to item_path(@item.id)
    end
  end

  def restore
    unless @message.update(delete_check:0)
      redirect_to redirect_to item_path(@item.id)
    end
    @seller_of_item = User.find(@message.item.seller_id)
    @item = @message.item.id
    respond_to do |format|
      format.json
    end
  end

  def destroy
    unless @message.destroy
      redirect_to redirect_to item_path(@item.id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:message,:item_id).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end 
  
end
