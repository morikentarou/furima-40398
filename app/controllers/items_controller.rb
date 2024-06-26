class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :user_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_id, :area_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def user_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if user_signed_in? && @item.user == current_user

    redirect_to action: :index
  end

  def sold_out_index
    return unless @item.sold_out?

    redirect_to action: :index
  end
end
