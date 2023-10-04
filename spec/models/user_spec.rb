require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '正常系' do

      it 'nicknameが存在すれば登録できる' do
        @user.nickname = 'testnickname'
        expect(@user).to be_valid
      end

      it 'emailが存在すれば登録できる' do
        @user.email = 'test@example.com'
        expect(@user).to be_valid
      end

      it 'passwordが存在すれば登録できる' do
        @user.password = 'password123'
        expect(@user).to be_valid
      end
      
      it 'password_confirmationが存在すれば登録できる' do
        @user.password_confirmation = 'password123'
        expect(@user).to be_valid
      end
      
      it 'first_nameが存在すれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it 'last_nameが存在すれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end

      it 'first_name_kanaが存在すれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end

      it 'last_name_kanaが存在すれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
    
      it 'birth_dateが存在すれば登録できる' do
        @user.birth_date = '2000-01-01'
        expect(@user).to be_valid
      end
    
      it 'first_nameがひらがな、カタカナ、漢字、「ー」、「－」のみからなると登録できる' do
        user = build(:user, first_name: '太郎')
        expect(user).to be_valid
      end

      it 'last_nameがひらがな、カタカナ、漢字、「ー」、「－」のみからなると登録できる' do
        user = build(:user, last_name: '山田')
        expect(user).to be_valid
      end

      it 'first_name_kanaがカタカナおよび「ー」「－」のみからと登録できる' do
        user = build(:user, first_name_kana: 'タロウ')
        expect(user).to be_valid
      end

      it 'last_name_kanaがカタカナおよび「ー」「－」のみからなると登録できる' do
        user = build(:user, last_name_kana: 'ヤマダ')
        expect(user).to be_valid
      end
    end

    context '異常系' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '全角文字を含むパスワードでは登録できない' do
  @user.password = 'パスワード123'
  @user.password_confirmation = 'パスワード123'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is invalid")
end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end

      it 'first_nameがひらがな、カタカナ、漢字、「ー」、「－」のみからならないと登録できない' do
        user = build(:user, first_name: 'tarou')
        user.valid?
        expect(user.errors[:first_name]).to include("is invalid")
      end

      it 'last_nameがひらがな、カタカナ、漢字、「ー」、「－」のみからならないと登録できない' do
        user = build(:user, last_name: 'yamada')
        user.valid?
        expect(user.errors[:last_name]).to include("is invalid")
      end
      
      it 'first_name_kanaがカタカナおよび「ー」「－」のみからならないと登録できない' do
        user = build(:user, first_name_kana: 'たろう')
        user.valid?
        expect(user.errors[:first_name_kana]).to include("is invalid")
      end

      it 'last_name_kanaがカタカナおよび「ー」「－」のみからならないと登録できない' do
        user = build(:user, last_name_kana: 'やまだ')
        user.valid?
        expect(user.errors[:last_name_kana]).to include("is invalid")
      end
    end
  end
end
