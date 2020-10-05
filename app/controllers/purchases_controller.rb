class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :seller_or_not
  before_action :sold_or_not

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_address_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:zip_code, :prefecture, :city, :address1, :address2, :phone_num, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

  def seller_or_not
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_or_not
    redirect_to root_path if Purchase.find_by(item_id: @item.id)
  end
end
