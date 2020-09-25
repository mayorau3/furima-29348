class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # deviseのバリデーションは上記で設定されている。
  validates :nickname, :birth_date, presence: true

  # パスワード半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  # 名前漢字・平仮名・カタカナ
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :kanji_family_name
    validates :kanji_first_name
  end

  # 名前カタカナ
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :kana_family_name
    validates :kana_first_name
  end

  has_many :items
  has_many :purchases
end
