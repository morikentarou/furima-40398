class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_user, only: [:index, :create]

  def index
    @destination_form = DestinationForm.new
  end

  def create
    @destination_form = DestinationForm.new(destination_params.merge(user_id: @user.id, item_id: @item.id))
    if @destination_form.save
      redirect_to  root_path
    else
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
    params.require(:destination_form).permit(:post_code, :area_id, :municipality, :street, :building, :tel)
  end
end
