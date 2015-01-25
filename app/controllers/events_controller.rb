class EventsController < ApplicationController
 
  before_filter :authenticate_user!, except: [:show, :index]


   def show
   	@event = Event.find(params[:id])
   end

  
  def new
  	@event = Event.new
    @event.items.build
  end
   
  
  def create

    # p params[:event]
    # flash[:notice] = "testing"

    # @event = current_user.events.build(event_params)
    # p @event.inspect
    # p @event.items.inspect

    #Begin -Not allowing to save to dev, used for testing purposes
    
    #p params
    #p event_params
    #flash[:notice] = "testing"
    #redirect_to new_event_path and return
#end


    # {"name"=>"birthday", "date(2i)"=>"1", "date(3i)"=>"8", "date(1i)"=>"2017", "items_attributes"=>{"0"=>{"name"=>"phone", "url"=>"phone.com"}}}
    # item = @event.items.build(event_params['items_attributes']['0'])
    # p event_params['items_attributes'][0]
    # p "item"
    # p item
    # redirect_to new_event_path and return

#     "event"=>{"name"=>"birthday"}, 
#        "item"=>{"name"=>"phone", "url"=>"phone.com"}
# "#<Event id: nil, name: \"graduation\", date: \"2017-04-08 00:00:00\", user_id: nil, created_at: nil, updated_at: nil>"

    @event = current_user.events.build(event_params)
     if @event.save
       flash[:success] = "Welcome!"
       redirect_to authenticated_root_path
     else
       render 'new'
     end
  end


  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:name, :date, items_attributes: [:id, :name, :url] )
    end

end