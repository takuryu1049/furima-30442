require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  describe '商品購入' do
    before do
      @order_delivery_address = FactoryBot.build(:order_delivery_address)
    end

      it '全ての値が正しく入力されていれば購入が成功する' do
        expect(@order_delivery_address).to be_valid
      end
# 郵便番号のテスト⬇️
      it 'p_codeが空だと登録できない' do
        @order_delivery_address.p_code = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include
        ("P code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと(全角ハイフンで検証)' do
        @order_delivery_address.p_code = "123ー4567"
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("P code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと(ハイフンなしで検証)' do
        @order_delivery_address.p_code = "1234567"
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("P code is invalid. Include hyphen(-)")
      end
      it 'postal_codeは〇〇○-〇〇○○という形で入力しないと登録できない(○は半角数字とする)' do
      @order_delivery_address.p_code = "1234-567"
      @order_delivery_address.valid?
      expect(@order_delivery_address.errors.full_messages).to include("P code is invalid. Include hyphen(-)")
      end
# 郵便番号のテスト⬆️
# 都道府県のテスト⬇️
      it 'prefectureを選択していないと登録できない' do
        @order_delivery_address.prefecture_id = 0
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
# 都道府県のテスト⬆️ 
# 市区町村のテスト⬇️
      it 'citiesが空の場合には登録できない' do
        @order_delivery_address.cities = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Cities can't be blank")
      end
# 市区町村のテスト⬆️
# 番地のテスト⬇️
      it 'addressが空の場合には登録できない' do
        @order_delivery_address.address = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Address can't be blank")
      end
# 番地のテスト⬆️
# 建物名のテスト⬇️
      it 'building_nameは空でも登録できる' do
        @order_delivery_address.building_name = nil
        expect(@order_delivery_address).to be_valid
      end
# 建物名のテスト⬆️
# 電話番号のテスト⬇️
      it 'phone_numが空の場合には登録できない' do
        @order_delivery_address.phone_num = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが半角数字ではない場合登録できない' do
        @order_delivery_address.phone_num = "１２３４５６７８９１２"
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone num 半角数字を入力してください")
      end
      it 'phone_numが11桁を超える場合登録できない' do
        @order_delivery_address.phone_num = 123456789123
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
      end
      it 'phone_numが11桁以内であれば場合登録できる' do
        @order_delivery_address.phone_num = "12345678912"
        expect(@order_delivery_address).to be_valid
      end
# 電話番号のテスト⬆️
# トークンのテスト⬇️
      it "tokenが空では登録できないこと" do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
# トークンのテスト⬆️
  end
end
