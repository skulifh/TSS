class TicketsController < ApplicationController

  private

  def event_params
  	params.require(:event).permit(:user, :event_id, :paid, :used)
  end
end
