class Event < ActiveRecord::Base
	def decrease_available()
		self.update_column :available, self.available - 1
	end
	def purchase_ticket()
		Ticket.create(user: "anonymous", event_id: self.id, paid: true, used: false)
	end
end
