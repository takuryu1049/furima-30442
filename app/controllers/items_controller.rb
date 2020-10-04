class ItemsController < ApplicationController
  def index
  end

  def new
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_burden_id, :shipment_source_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
