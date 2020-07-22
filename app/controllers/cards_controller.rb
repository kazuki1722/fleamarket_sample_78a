class CardsController < ApplicationController

  before_action :category_parent_array

  def index
    @card = CreditCard.where(user_id: current_user.id).first
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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
  end

  private
  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil) 
  end

end
