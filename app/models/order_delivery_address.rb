class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :p_code, :prefecture_id ,:cities, :address, :building_name, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :p_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :address
    validates :phone_num , format: { with: /\A[0-9]+\z/, message: "半角数字を入力してください"},length: {maximum: 11}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order =Order.create(user_id: user_id, item_id: item_id)  
    DeliveryAddress.create(p_code: p_code,prefecture_id: prefecture_id,cities: cities,address: address, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end

end