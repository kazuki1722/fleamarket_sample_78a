class MessagesController < ApplicationController

  before_action :set_message, only: [:update,:destroy,:restore]

  def create
    @message = Message.create(message_params)
    @seller_of_item = User.find(@message.item.seller_id)
    @item = @message.item.id
    respond_to do |format|
      format.json
    end
  end

  def update
    @message.update(delete_check:1)
  end

  def restore
    @message.update(delete_check:0)
    @seller_of_item = User.find(@message.item.seller_id)
    @item = @message.item.id
    respond_to do |format|
      format.json
    end
  end

  def destroy
    @message.destroy
  end

  private
  def message_params
    params.require(:message).permit(:message,:item_id).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end 
  
end
