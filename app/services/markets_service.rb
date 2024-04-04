class MarketsService
	def get_all_markets
		get_url("/api/v0/markets")
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