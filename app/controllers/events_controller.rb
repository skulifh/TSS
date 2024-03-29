require 'socket'
class EventsController < ApplicationController
  def index

  end

  def show
  	@event = Event.find(params[:id])
  end

  def specific
    @form = params[:tyid].to_i
    @events = Event.where("form == ?", @form)
  end

  def purchase
    if(!current_user)
      redirect_to signin_path()
    end
  	@event = Event.find(params[:id])
  end

  def confirm_purchase
  	@event = Event.find(params[:id])
    credit_card = params[:creditcard][:number]


  	a = TCPSocket.new('46.149.22.251', 2000) # could replace 127.0.0.1 with your "real" IP if desired.
	  a.write credit_card
	  @reply = a.recv(1024)
	  a.close

    if (@reply.to_i == 1)
      @event.decrease_available()
      @event.purchase_ticket(current_user.id)
    end


  end

  def new
    @event = Event.new
  end

  def create
    #params.permit!
  	@event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      redirect_to root_path
    end
    
  end

  def update
    redirect_to current_account.event.find(params[:id]).tap { |event|
      event.update!(event_params)
    }
  end

  def destroy
        @event = Event.find(params[:event_id])
        @event.destroy
        redirect_to :back
  end

  private

  def event_params
  	params.require(:event).permit(:name, :description, :price, :form, :tickets, :available, :photo)
  end
end
