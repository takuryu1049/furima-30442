class OrdersController < ApplicationController
  def index
    @order_delivery_address = OrderDeliveryAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_delivery_address_params)
    if @order_delivery_address.valid?
      @order_delivery_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      inti_value(@order_delivery_address)
      render :index
    end
  end

  private

  def order_delivery_address_params
    params.require(:order_delivery_address).permit(:p_code,:prefecture_id,:cities,:address,:building_name,:phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def inti_value(order_delivery_address)
    order_delivery_address.p_code = ""
    order_delivery_address.prefecture_id = 0
    order_delivery_address.cities = ""
    order_delivery_address.address = ""
    order_delivery_address.building_name = ""
    order_delivery_address.phone_num = ""
  end
  # ※冗長かもしれないが今まで習った範囲だとこれしかないと思う。user_idとitem_idは初期化やっていないためセキュリティ面大丈夫か？。

end
