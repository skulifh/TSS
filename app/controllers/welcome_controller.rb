class WelcomeController < ApplicationController
  def index
  	@events = Event.all()
  	@displays = Display.all()
  end
end
