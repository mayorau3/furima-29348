class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # deviseのバリデーションは上記で設定されている。
  validates :nickname, :birth_date, presence: true

  # パスワード半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  # 名前漢字・平仮名・カタカナ
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :kanji_family_name
    validates :kanji_first_name
  end

    # 名前カタカナ
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :kana_family_name
    validates :kana_first_name
  end
end