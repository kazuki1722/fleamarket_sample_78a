class CardsController < ApplicationController
  def index
    @card = CreditCard.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new" 
    else
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

end
