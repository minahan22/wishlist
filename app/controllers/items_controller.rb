class ItemsController < ApplicationController
def index
  @item = current_user.items
end

 def new
 #@item = current_user.item.order("events.name").joins(:event).select("items.*, events.name as event_names")
 @item = Item.new
 
 @open_status_id = ItemStatus.find_by(name: "Open").id
  end
   
  
  def create
  @item = current_user.items.build(item_params)
 #@item = current_user.item.build(event_id: params[:item][:event_id])
     if @item.save
       flash[:success] = "Created Item!"
       redirect_to authenticated_root_path
     else
       render 'new'
     end
  end

   def updates
    p "params output"
    p params
    flash[:notice] = "testing redirect"
    redirect_to redirect_to user_index_path
   end

   def purchased
   @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Item Purchased"
      p session[:search]
      
      redirect_to users_path(search: session[:search])
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
params.require(:item).permit(:id, :name, :url, :status_id,:event_id, :purchased,
  events_attributes: [:id,:name, :date,:user_id])
end
end







