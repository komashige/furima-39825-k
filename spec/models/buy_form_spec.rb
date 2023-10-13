require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item) 
    @buy_form = FactoryBot.build(:buy_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@buy_form).to be_valid
      end

      it '建物名がなくても保存できる' do
        @buy_form.building_name = ''
        expect(@buy_form).to be_valid
      end
    end

    context '配送先情報が保存できない場合' do
      it '郵便番号が空だと保存できない' do
        @buy_form.post_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道府県が選択されていないと保存できない' do
        @buy_form.ship_area_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Ship area select")
      end

      it '市区町村が空だと保存できない' do
        @buy_form.city = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @buy_form.street_address = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @buy_form.telephone_number = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が10桁または11桁でないと保存できない' do
        @buy_form.telephone_number = '090123456789' # 12桁の番号
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Telephone number input only number")
      end
    end
  end
end