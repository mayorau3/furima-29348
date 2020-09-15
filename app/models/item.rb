class Item < ApplicationRecord
  belongs_to :user

  validates :name, :explanation, :category, :item_status, :shipping_fee, :ship_from, :num_days, presence: true

  # 価格の範囲指定 ¥300〜¥9,999,999の間、半角数字のみ可
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
