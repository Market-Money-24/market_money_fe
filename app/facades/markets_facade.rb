class MarketsFacade
	def markets
		response = MarketsService.new.get_all_markets
		market_poro_factory(response[:data])
	end

	def market_poro_factory(market_data)
		market_data.flat_map do |market|
			MarketPoro.new(market[:id], market[:attributes])
		end
	end
end