require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname｜email｜password｜password_confirmation｜first_name｜last_name｜first_name_kana｜last_name_kana｜birth｜が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailの中に@が含まれていない場合は登録できないこと' do
        @user.email = @user.email.gsub(/@/, '')
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が異なる場合登録できないこと' do
        @user.password = 'test0000@.com'
        @user.password_confirmation = 'test1111@.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角ひらがな、全角カタカナ、漢字ではない文字列が含まれている場合登録できないこと' do
        @user.first_name = 'aあ１いち三３ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角ひらがな、全角カタカナ、漢字で入力必要(名前(全角)/苗字)')
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角ひらがな、全角カタカナ、漢字ではない文字列が含まれている場合登録できないこと' do
        @user.last_name = 'aあ１いち三３ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角ひらがな、全角カタカナ、漢字で入力必要(名前(全角)/名前)')
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_nam_kanaが全角カタカナではない文字列が含まれている場合登録できないこと' do
        @user.first_name_kana = 'あ漢ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力必要(名前カナ(全角)/苗字)')
      end
      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナではない文字列が含まれている場合登録できないこと' do
        @user.last_name_kana = 'あ漢ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力必要(名前カナ(全角)/名前)')
      end
      it 'birthが空では登録できないこと' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
