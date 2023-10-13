require 'rails_helper'

RSpec.describe Ship, type: :model do
  before do
    user = FactoryBot.create(:user)
    @ship = FactoryBot.build(:ship, user_id: user_id)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@ship).to be_valid
      end

      it '建物名がなくても保存できる' do
        @ship.building_name = ''
        expect(@ship).to be_valid
      end
    end

    context '配送先情報が保存できない場合' do
      it '郵便番号が空だと保存できない' do
        @ship.post_code = ''
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道府県が選択されていないと保存できない' do
        @ship.ship_area_id = 1
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Ship area select")
      end

      it '市区町村が空だと保存できない' do
        @ship.city = ''
        @ship.valid?
        expect(@ship.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @ship.street_address = ''
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @ship.telephone_number = ''
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が10桁または11桁でないと保存できない' do
        @ship.telephone_number = '090123456789' # 12桁の番号
        @ship.valid?
        expect(@ship.errors.full_messages).to include("Telephone number input only number")
      end
    end
  end
end