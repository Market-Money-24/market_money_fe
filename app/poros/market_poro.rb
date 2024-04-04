class MarketPoro
	attr_reader :id, :name, :city, :state
	
	def initialize(id, attributes)
		@id = id
		@name = attributes[:name]
		@city = attributes[:city]
		@state = attributes[:state]
	end
end