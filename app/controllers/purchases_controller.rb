class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_add_params)
    @purchase.save
  end
  
  private

  def purchase_add_params
    params.require(:purchase_address).permit(:zip_code, :prefecture, :city, :address1, :address2, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
