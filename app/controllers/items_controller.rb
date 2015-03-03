class ItemsController < ApplicationController
def Index
@item = Item.order("events.name").joins(:event).select("items.*, events.name as event_names")
end


def show 
  @item = Item.order("events.name").joins(:event).select("items.*, events.name as event_names")
 end

 def new
 @item = current_user.item.order("events.name").joins(:event).select("items.*, events.name as event_names")
 p @item
 @open_status_id = ItemStatus.find_by(name: "Open").id
  end
   
  
  def create
  @item = current_user.item.build(item_params)
     if @item.save
       flash[:success] = "Created Item!"
       redirect_to authenticated_root_path
     else
       render 'new'
     end
  end

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
params.require(:item).permit(:id, :name, :url, :status_id, :purchased, :Purchased_By,
 events_attributes: [:id, :name, :date, :user_id])
end
end







