class VendorPoro
	attr_reader :id, :name, :contact_name, :phone, :credit_accepted, :description

	def initialize(id, attributes)
		@id = id
		@name = attributes[:name]
		@contact_name = attributes[:contact_name]
		@phone = attributes[:contact_phone]
		@credit_accepted = attributes[:credit_accepted] ? "YES" : "NO"
		@description = attributes[:description]
	end
end