class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string  :p_code, null: false
      t.integer :prefecture_id, null: false
      t.string  :cities, null: false
      t.string  :address, null: false
      t.string  :building_name
      t.string  :phone_num, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
