require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'reading_last_nameが空では登録できない' do
        @user.reading_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading first name can't be blank")
      end
      it 'reading_last_nameが空では登録できない' do
        @user.reading_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Reading last name can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailは@が含まれないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = '1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字がないと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角英がないと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは全角文字を含むと登録できない' do
        @user.password = 'あa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.reading_last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading last name is invalid')
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.reading_last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading last name is invalid')
      end
      it 'reading_last_nameがカタカナでないと登録できない' do
        @user.reading_last_name = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading last name is invalid')
      end
      it 'reading_first_nameがカタカナでないと登録できない' do
        @user.reading_first_name = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include('Reading first name is invalid')
      end
    end
  end
end
