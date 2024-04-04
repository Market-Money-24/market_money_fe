class MarketsService
	def get_all_markets
		get_url("/api/v0/markets")
	end

	def get_market(market_id)
		get_url("/api/v0/markets/#{market_id}")
	end

	def get_all_vendors(market_id)
		get_url("/api/v0/markets/#{market_id}/vendors")
	end

	def get_vendor(vendor_id)
		get_url("/api/v0/vendors/#{vendor_id}")
	end

	def get_url(url)
		res = conn.get(url)
		JSON.parse(res.body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: "http://localhost:3000") do |f|
			f.headers["Content-Type"] = "application/json"
		end
	end
end