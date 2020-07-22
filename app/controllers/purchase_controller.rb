class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_item
  before_action :set_card

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "credit_cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    if @item.buyer_id.present?
      redirect_to item_path(@item.id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力
    :customer => @card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    #製品のbuyer_idを付与
    @item.update( buyer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  end

  def done
    @card = CreditCard.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    @default_card_brand = @default_card_information.brand
    case @default_card_brand
    when "Visa"
      @default_card_src = "visa.svg"
    when "JCB"
      @default_card_src = "jcb.svg"
    when "MasterCard"
      @default_card_src = "master-card.svg"
    when "American Express"
      @default_card_src = "american_express.svg"
    when "Diners Club"
      @default_card_src = "dinersclub.svg"
    when "Discover"
      @default_card_src = "discover.svg"
    when "SaisonCard"
      @default_card_src = "saison-card.svg"
    end
  end

  private
  def set_card
    @card = CreditCard.where(user_id: current_user.id).first
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
