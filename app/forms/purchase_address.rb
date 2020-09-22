class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture, :city, :address1, :address2, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :city, :address1
    # 「住所」の郵便番号に関するバリデーション
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    # 「電話番号」に関するバリデーション
    validates :phone_num, length: { maximum: 11 }
  end
  # 「住所」の都道府県に関するバリデーション
  validates :prefecture, numericality: { other_than: 1, message: "Select" }

  def save
    # purchaseを保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(zip_code: zip_code, prefecture: prefecture, city: city, address1: address1, address2: address2, phone_num: phone_num, purchase_id: purchase.id)
  end
end