class ItemsController < ApplicationController
  before_action :move_to_session_new, only: :new

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :ship_fee_id, :ship_from_id, :num_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_session_new
    redirect_to new_user_session_path unless user_signed_in?
  end
end
