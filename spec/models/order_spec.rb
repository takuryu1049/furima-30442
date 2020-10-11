require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:order)
    end
    # userアソシエーションのテスト⬇️
    it 'userが紐づいてないと保存できない' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('User must exist')
    end
    # userアソシエーションのテスト⬆️
    # itemアソシエーションのテスト⬇
    it 'itemが紐づいていないと保存できない' do
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Item must exist')
    end
    # itemアソシエーションのテスト⬆️
  end
end
