class MarketsFacade
	def markets
		market_data = MarketsService.new.get_all_markets
		market_poro_factory(market_data[:data])
	end

	def market(market_id)
		market_data = MarketsService.new.get_market(market_id)
		market_poro_factory([market_data[:data]])
	end

	def vendors(market_id)
		vendor_data = MarketsService.new.get_all_vendors(market_id)
		vendor_poro_factory(vendor_data[:data])
	end

	def vendor(vendor_id)
		vendor_data = MarketsService.new.get_vendor(vendor_id)
		vendor_poro_factory([vendor_data[:data]])
	end

	def market_poro_factory(market_data)
		market_data.flat_map do |market|
			MarketPoro.new(market[:id], market[:attributes])
		end
	end

	def vendor_poro_factory(vendor_data)
		vendor_data.flat_map do |vendor|
			VendorPoro.new(vendor[:id], vendor[:attributes])
		end
	end
end