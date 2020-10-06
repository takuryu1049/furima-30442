class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit]
  
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :status_id, :delivery_burden_id, :shipment_source_id, :day_to_ship_id, :price
    ).merge(user_id: current_user.id)
  end
end
