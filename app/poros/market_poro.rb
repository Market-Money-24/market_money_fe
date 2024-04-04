class MarketPoro
	attr_reader :name, :city, :state
	
	def initialize(attributes)
		@name = attributes[:name]
		@city = attributes[:city]
		@state = attributes[:state]
	end
end