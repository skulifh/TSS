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
  	@event = Event.find(params[:id])
  end

  def confirm_purchase
  	@event = Event.find(params[:id])
  	a = TCPSocket.new('46.149.22.251', 2000) # could replace 127.0.0.1 with your "real" IP if desired.
	  a.write "jon"
	  @reply = a.recv(1024)
	  a.close

    if (@reply.to_i == 1)
      @event.decrease_available()
      @event.purchase_ticket()
    end


  end

  def create
  	Event.create(event_params)
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
  	params.require(:event).permit(:name, :description, :price, :form, :tickets, :available)
  end
end
