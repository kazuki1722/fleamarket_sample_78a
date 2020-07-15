class MessagesController < ApplicationController

  before_action :set_message, only: [:update,:destroy,:restore]
  before_action :check_user, only: [:update,:destroy,:restore]

  def create
    @message = Message.new(message_params)
    @seller_of_item = User.find(@message.item.seller_id)
    @message.save
    redirect_to item_path(@message.item.id)
  end

  def update
    @message.update(delete_check:1)
    redirect_to item_path(@message.item.id)
  end

  def restore
    @message.update(delete_check:0)
    redirect_to item_path(@message.item.id)
  end

  def destroy
    @message.destroy
    redirect_to item_path(@message.item.id)
  end

  private
  def message_params
    params.require(:message).permit(:message,:item_id).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def check_user
    unless @message.item.seller == current_user
      flash[:alert] = "その操作はできません"
      redirect_to root_path
    end
  end
 
  
end
