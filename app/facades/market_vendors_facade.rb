class MarketVendorsFacade < ApplicationController 
	def vendors
		require 'pry'; binding.pry
		vendors_hash = MarketVendorsService.new.get_all_vendors
	end
end