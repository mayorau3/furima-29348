class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :num_day

  validates :name, :explanation, :category_id, :status_id, :ship_fee_id, :prefecture_id, :num_day_id, :images, presence: true

  # 価格の範囲指定 ¥300〜¥9,999,999の間、半角数字のみ可
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' },
                    format: { with: /\A.[0-9]+\z/, message: 'Half-width number' }

  # 選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :ship_fee_id, :prefecture_id, :num_day_id, numericality: { other_than: 1, message: 'Select' }

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
