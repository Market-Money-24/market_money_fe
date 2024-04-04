class MarketVendorsFacade < ApplicationController 
	def vendors(market_id)
		vendors_hash = MarketVendorsService.new.get_all_vendors(market_id)
		create_vendor_poros(vendors_hash[:data])
	end

	def create_vendor_poros(vendors_hash)
		vendors_hash.flat_map do |vendor|
			VendorPoro.new(vendor[:id], vendor[:attributes])
		end
	end
end