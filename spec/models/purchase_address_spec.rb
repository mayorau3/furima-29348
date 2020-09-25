require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号(zip_code)が空だと保存できないこと' do
      @purchase_address.zip_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
    end

    it '郵便番号(zip_code)が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.zip_code = '9998888'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Zip code Input correctly')
    end

    it '都道府県(prefecture)を選択していないと(「---」を選択していると)保存できないこと' do
      @purchase_address.prefecture = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村(city)は空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地(address1)は空だと保存できないこと' do
      @purchase_address.address1 = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address1 can't be blank")
    end

    it '建物名(address2)は空でも保存できること' do
      @purchase_address.address2 = nil
      expect(@purchase_address).to be_valid
    end

    it '電話番号(phone_num)が空だと保存できないこと' do
      @purchase_address.phone_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
    end

    it '電話番号(phone_num)が11桁以上だと保存できないこと' do
      @purchase_address.phone_num = "123456789012"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
    end
  
  end
end
