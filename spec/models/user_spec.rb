require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての入力項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'ニックネームが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したメールアドレスが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに@がないと登録できないこと' do
      @user.email = 'test.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字以上であれば登録できること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end

    it 'パスワードが5文字以下であれば登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが半角英数字混合でないと登録できないこと' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'パスワードが存在しても確認用パスワードが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名の名字が空では登録できないこと' do
      @user.kanji_family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji family name can't be blank")
    end

    it 'ユーザー本名の名字が全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.kanji_family_name = 'ab1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kanji family name Full-width characters')
    end

    it 'ユーザー本名の名前が空では登録できないこと' do
      @user.kanji_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
    end

    it 'ユーザー本名の名前が全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.kanji_first_name = 'ｱｲｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kanji first name Full-width characters')
    end

    it 'ユーザー本名の名字カナが空では登録できないこと' do
      @user.kana_family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name can't be blank")
    end

    it 'ユーザー本名の名字カナがカタカナでないと登録できないこと' do
      @user.kana_family_name = '名まえ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana family name Full-width katakana characters')
    end

    it 'ユーザー本名の名前カナが空では登録できないこと' do
      @user.kana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'ユーザー本名の名前カナがカタカナでないと登録できないこと' do
      @user.kana_first_name = 'namae'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
    end

    it '生年月日が空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
