class ItemsController < ApplicationController
  before_action :move_to_session_new, only: :new
  before_action :set_item, only: [:show, :edit, :update]
  before_action :search_item, only: [:index, :search, :show]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
    @results = @p.result
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :ship_fee_id, :prefecture_id, :num_day_id, :price, images: []).merge(user_id: current_user.id)
  end

  def move_to_session_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

end
