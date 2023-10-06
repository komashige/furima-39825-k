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
        expect(@item).not_to be_valid
      end

      it '商品名がないと無効' do
        @item.name = ''
        expect(@item).not_to be_valid
      end

      it '商品の説明がないと無効' do
        @item.description = ''
        expect(@item).not_to be_valid
      end

      it 'categoryを選択していない場合は無効' do
        @item.category_id = 1
        expect(@item).not_to be_valid
      end

      it 'conditionを選択していない場合は無効' do
        @item.condition_id = 1
        expect(@item).not_to be_valid
      end

      it 'ship_areaを選択していない場合は無効' do
        @item.ship_area_id = 1
        expect(@item).not_to be_valid
      end

      it 'hip_costを選択していない場合は無効' do
        @item.ship_cost_id = 1
        expect(@item).not_to be_valid
      end

      it 'hip_dayを選択していない場合は無効' do
        @item.ship_day_id = 1
        expect(@item).not_to be_valid
      end

      it '価格がないと無効' do
        @item.price = nil
        expect(@item).not_to be_valid
      end

      it '価格が300円未満の場合は無効' do
        @item.price = 299
        expect(@item).not_to be_valid
      end

      it '価格が9,999,999円より大きい場合は無効' do
        @item.price = 10000000
        expect(@item).not_to be_valid
      end

      it '価格が整数でない場合は無効' do
        @item.price = 300.5
        expect(@item).not_to be_valid
      end

      it '価格が半角数字以外の場合は無効（英字の場合）' do
        @item.price = 'abc'
        expect(@item).not_to be_valid
      end
      
      it '価格が半角数字以外の場合は無効（全角数字の場合）' do
        @item.price = '３００'
        expect(@item).not_to be_valid
      end
      
      it '価格が半角数字以外の場合は無効（半角カナの場合）' do
        @item.price = 'ｱｲｳ'
        expect(@item).not_to be_valid
      end
      
      it '価格が半角数字以外の場合は無効（全角文字の場合）' do
        @item.price = 'あいう'
        expect(@item).not_to be_valid
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
