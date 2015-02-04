class PagesController < ApplicationController
 	before_filter :authenticate_user!

   def home
   	@events = current_user.events
   end

def destroy
    @events = Event.find(params[:id])
     if @events.destroy
       flash[:success] = "Go HOME!"
       redirect_to authenticated_root_path
     else
       render 'edit'
     end
  end

  def update
    p "params output"
    p params
    @events = @events.find(session[:user])
    flash[:notice] = "testing redirect"
    #redirect_to authenticated_root_path
    redirect_to authenticated_root_path
   end


end