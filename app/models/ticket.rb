class Ticket < ActiveRecord::Base
	has_one :event
	has_one :user
end
