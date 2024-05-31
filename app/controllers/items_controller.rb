class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
     end
  end

  private
  def prototype_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end

