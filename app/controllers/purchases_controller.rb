class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
