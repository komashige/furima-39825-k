require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '正常系' do
      it '全てが正しく入力されていれば有効' do
        expect(@item).to be_valid
      end
    end
  
    context '異常系' do
      it '画像がないと無効' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it '商品名がないと無効' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it '商品の説明がないと無効' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
  
      it 'categoryを選択していない場合は無効' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
  
      it 'conditionを選択していない場合は無効' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
  
      it 'ship_areaを選択していない場合は無効' do
        @item.ship_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end
  
      it 'ship_costを選択していない場合は無効' do
        @item.ship_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end
  
      it 'ship_dayを選択していない場合は無効' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
  
      it '価格がないと無効' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
  
      it '価格が300円未満の場合は無効' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
  
      it '価格が9,999,999円より大きい場合は無効' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
  
      it '価格が整数でない場合は無効' do
        @item.price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
  
      it '価格が半角数字以外の場合は無効（英字の場合）' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
  
      it '価格が半角数字以外の場合は無効（全角数字の場合）' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
  
      it '価格が半角数字以外の場合は無効（半角カナの場合）' do
        @item.price = 'ｱｲｳ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
  
      it '価格が半角数字以外の場合は無効（全角文字の場合）' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
