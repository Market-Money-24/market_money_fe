class MarketVendorsController < ApplicationController
	def index
		facade = MarketVendorsFacade.new
		@market_vendors = facade.vendors(params[:market_id])
	end
end