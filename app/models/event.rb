class Event < ActiveRecord::Base
	has_many :ticket
	has_attached_file :photo,
		:styles => {:preview => ['320x150#'], :speciffic => ['800x300#']},
		:path => ":rails_root/public/data/photos/:id/:basename_:style.:extension",
		:url => "/data/photos/:id/:basename_:style.:extension"
		#:path => ":rails_root/public/data/photos/1/subpage-banner.jpg",
		#:url => "/data/photos/1/subpage-banner.jpg"
	#validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	validates_attachment :photo,
    	:presence => true,
    	content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	def decrease_available()
		self.update_column :available, self.available - 1
	end
	def purchase_ticket(user_id)
		Ticket.create(user_id: user_id, event_id: self.id, paid: true, used: false)
	end

end
