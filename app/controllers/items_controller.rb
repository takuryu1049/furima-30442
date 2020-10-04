class ItemsController < ApplicationController
  def index
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

  def calc
    # price = (金額だけストロングで流す)
    # fee = 金額*0.1で利益を計算する
    # profit = price - fee
    # render json: {fee:fee,profit:profit}
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_burden_id, :shipment_source_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
  
end
