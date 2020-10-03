class User < ApplicationRecord
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、全角カタカナ、漢字で入力必要(名前(全角)/苗字)' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、全角カタカナ、漢字で入力必要(名前(全角)/名前)' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力必要(名前カナ(全角)/苗字)' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力必要(名前カナ(全角)/名前)' }
    validates :birth
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
