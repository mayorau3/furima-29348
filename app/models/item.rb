class Item < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :num_day

  validates :name, :explanation, :category_id, :status_id, :ship_fee_id, :ship_from_id, :num_day_id, presence: true

  # 価格の範囲指定 ¥300〜¥9,999,999の間、半角数字のみ可
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
