class MarketPoro
	attr_reader :id, :name, :street, :city, :state, :zip
	
	def initialize(id, attributes)
		@id = id
		@name = attributes[:name]
		@street = attributes[:street]
		@city = attributes[:city]
		@state = attributes[:state]
		@zip = attributes[:zip]
	end
end