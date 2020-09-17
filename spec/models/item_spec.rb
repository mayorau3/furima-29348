require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての入力項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it "商品画像が空では登録できないこと" do
    #テストどうやる？  @item.image = nil
    # @item.valid?
    # expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では登録できないこと" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "カテゴリーが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "カテゴリーが「---」では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    
    it "商品の状態が空では登録できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "商品の状態が「---」では登録できないこと" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end

    it "配送料の負担が空では登録できないこと" do
      @item.ship_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship fee can't be blank")
    end

    it "配送料の負担が「---」では登録できないこと" do
      @item.ship_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship fee Select')
    end

    it "発送元の地域が空では登録できないこと" do
      @item.ship_from_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from can't be blank")
    end

    it "発送元の地域が「---」では登録できないこと" do
      @item.ship_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship from Select')
    end

    it "発送までの日数が空では登録できないこと" do
      @item.num_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Num day can't be blank")
    end

    it "発送までの日数が「---」では登録できないこと" do
      @item.num_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Num day Select')
    end

    it "販売価格が空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "販売価格が¥300より小さいと登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it "販売価格が¥9,999,999より大きいと登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it "販売価格が全角数字だと登録できないこと" do
      @item.price = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
