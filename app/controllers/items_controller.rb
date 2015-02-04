class ItemsController < ApplicationController


   def update
    p "params output"
    p params

    flash[:notice] = "testing redirect"
    redirect_to redirect_to user_index_path
   end

   def purchased
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Item Purchased"
      redirect_to users_path
    else
      render 'edit'
    end
  end

 ## def purchased
   # p "params output"
   # p params
   # flash[:notice] = "testing new custom route"
   # redirect_to users_path
   #end

   def edit
    @item = Item.find(params[:id])
  end

  def item_params 

params.require(:item).permit(:id, :name, :url, :status_id, :purchased)
end
end