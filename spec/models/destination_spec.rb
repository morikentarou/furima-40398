require 'rails_helper'
RSpec.describe Destination, type: :model do
  before do
    @destination = FactoryBot.build(:destination)
  end
  describe '出品商品の新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が存在すれば登録できる' do
        expect(@destination).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @destination.building = nil
        expect(@destination).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'post_codeが空では登録できない' do
        @destination.post_code  = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code can't be blank","Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'area_idが空では登録できない' do
        @destination.area_id  = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空では登録できない' do
        @destination.municipality  = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'streetが空では登録できない' do
        @destination.street  = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Street can't be blank")
      end
      it 'telが空では登録できない' do
        @destination.tel  = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel can't be blank")
      end
      it 'post_codeが3桁ハイフン4桁でないと登録できない' do
        @destination.post_code  = 1234567
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'post_codeが半角文字列でないと登録できない' do
        @destination.post_code  = "１２３－４５６７"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'area_idが---では登録できない' do
        @destination.area_id = 1
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Area can't be blank")
      end
      it 'telが10桁以上でないと登録できない' do
        @destination.tel  = 100_000_000
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel is too short (minimum is 10 characters)")
      end
      it 'telが11桁以内でないと登録できない' do
        @destination.tel  = 100_000_000_000
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
      it 'telが半角数値でないと登録できない' do
        @destination.tel  = "００００００００００"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Tel is invalid. Input half-width numbers.")
      end
    end
  end
end
