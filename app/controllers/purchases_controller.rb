class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :seller_or_not
  before_action :sold_or_not

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_add_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def purchase_add_params
    params.require(:purchase_address).permit(:zip_code, :prefecture, :city, :address1, :address2, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def card_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: card_params[:token],
      currency:'jpy'
    )
  end

  def seller_or_not
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def sold_or_not
    purchases = Purchase.all
    purchases.each do |perchase|
      if perchase[:item_id] == @item.id
        return redirect_to root_path
      end
    end
  end

end
