class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day_to_ship
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :delivery_burden_id, numericality: { other_than: 1 } 
    validates :shipment_source_id, numericality: { other_than: 0 } 
    validates :day_to_ship_id ,numericality: { other_than: 1 } 
    validates :price, numericality: {greater_than: 299, less_than: 10000000}, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

end
