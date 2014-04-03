class Ticket < ActiveRecord::Base
	has_one :event
end
