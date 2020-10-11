class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_index
  before_action :sold_out_index

  def index
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_delivery_address_params)
    if @order_delivery_address.valid?
      pay_item
      @order_delivery_address.save
      redirect_to root_path
    else
      inti_value(@order_delivery_address)
      render :index
    end
  end

  private

  def order_delivery_address_params
    params.require(:order_delivery_address).permit(:p_code, :prefecture_id, :cities, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def inti_value(order_delivery_address)
    order_delivery_address.p_code = ''
    order_delivery_address.prefecture_id = 0
    order_delivery_address.cities = ''
    order_delivery_address.address = ''
    order_delivery_address.building_name = ''
    order_delivery_address.phone_num = ''
  end
  # ※冗長かもしれないが今まで習った範囲だとこれしかないと思う。user_idとitem_idは初期化やっていないためセキュリティ面大丈夫か？。

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_delivery_address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if user_signed_in?
      redirect_to root_path if current_user.id == @item.user.id
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

def sold_out_index
  redirect_to root_path if @item.order
end
