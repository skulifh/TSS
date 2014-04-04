class TicketsController < ApplicationController

  private

  def event_params
  	params.require(:event).permit(:user_id, :event_id, :paid, :used)
  end
end
