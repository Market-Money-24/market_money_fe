class VendorPoro
	attr_reader :id, :name, :phone, :credit_accepted, :description

	def initialize(id, attributes)
		@id = id
		@name = attributes[:name]
		@phone = attributes[:contact_phone]
		@credit_accepted = attributes[:credit_accepted]
		@description = attributes[:description]
	end
end