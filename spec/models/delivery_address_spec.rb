require 'rails_helper'

RSpec.describe DeliveryAddress, type: :model do
  describe '商品購入' do
    before do
      @delivery_address = FactoryBot.build(:delivery_address)
    end
    # orderアソシエーションのテスト⬇️
    it 'orderが紐づいてないと保存できない' do
      @delivery_address.order = nil
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include('Order must exist')
    end
    # orderアソシエーションのテスト⬆️
  end
end
