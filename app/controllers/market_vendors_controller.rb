class VendorsController < ApplicationController
	def index
		@market_vendors = MarketVendorsFacade.new.vendors
	end
end