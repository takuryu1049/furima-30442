class UserDonation
  include ActiveModel::Model
  attr_accessor :p_code, :prefecture_id ,:cities, :address, :building_name, :phone_num

  with_options presence: true do
    validates :p_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :address
    validates :phone_num , format: { with: /\A[0-9]+\z/, message: "数字を入力してください",length: {maxinum: 11}}
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
end