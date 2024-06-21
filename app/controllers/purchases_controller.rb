class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_user, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @destination_form = DestinationForm.new
  end

  def create
    @destination_form = DestinationForm.new(destination_params.merge(user_id: @user.id, item_id: @item.id))
    if @destination_form.valid?
      pay_item
      @destination_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_user
    @user = current_user
  end

  def destination_params
    params.require(:destination_form).permit(:post_code, :area_id, :municipality, :street, :building,
                                             :tel).merge(token: params[:token])
  end

  def pay_item
    @destination_form.price = @item.price
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @destination_form.price,
      card: @destination_form.token,
      currency: 'jpy'
    )
  end
end
