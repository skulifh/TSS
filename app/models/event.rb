class Event < ActiveRecord::Base
	has_many :ticket
	def decrease_available()
		self.update_column :available, self.available - 1
	end
	def purchase_ticket(user_id)
		Ticket.create(user_id: user_id, event_id: self.id, paid: true, used: false)
	end
end
